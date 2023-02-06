import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos_multithread/model/api/repos_list_response.dart';

void main() {
  Map<String, dynamic> ownerData = {
    'login': 'test',
    'id': 1,
    'avatar_url': 'www.example.com',
    'url': 'www.example.com'
  };
  Map<String, dynamic> repoData1 = {
    'id': 0,
    'name': 'aaa',
    'private': false,
    'owner': ownerData,
    'html_url': 'www.repo.com/1',
    'description': 'desc'
  };

  Map<String, dynamic> repoData2 = {
    'id': 1,
    'name': 'bbb',
    'private': true,
    'owner': ownerData,
    'html_url': 'www.repo.com/2',
    'description': 'desc2'
  };

  test('ReposListResponse parses reposList correctly', () {
    ReposListResponse reposListResponse =
        ReposListResponse(isSuccess: true, totalCount: 2, reposListJson: [repoData1, repoData2]);
    expect(reposListResponse.reposList?.length, 2);
    expect(reposListResponse.reposList?[0].id, repoData1['id']);
    expect(reposListResponse.reposList?[0].name, repoData1['name']);
    expect(reposListResponse.reposList?[0].owner, isNot(null));

    expect(reposListResponse.reposList?[1].id, repoData2['id']);
    expect(reposListResponse.reposList?[1].name, repoData2['name']);
    expect(reposListResponse.reposList?[1].owner, isNot(null));
  });
}
