import 'package:github_repos_multithread/model/github_repo.dart';

class ReposListResponse {
  final List<GitHubRepo> reposList;
  final int totalCount;

  ReposListResponse({required List<dynamic> reposListJson, this.totalCount = 0})
      : reposList = reposListJson.map((dynamic json) => GitHubRepo.fromJson(json)).toList();
}
