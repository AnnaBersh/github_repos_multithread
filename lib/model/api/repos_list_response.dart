import 'package:github_repos_multithread/model/api/base_network_response.dart';
import 'package:github_repos_multithread/model/github_repo.dart';

class ReposListResponse extends BaseNetworkResponse{
  final List<GitHubRepo>? reposList;
  final int totalCount;

  ReposListResponse({required super.isSuccess, List<dynamic>? reposListJson, super.error, this.totalCount = 0})
      : reposList = reposListJson?.map((dynamic json) => GitHubRepo.fromJson(json)).toList();
}
