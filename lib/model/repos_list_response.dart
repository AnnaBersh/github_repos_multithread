import 'package:github_repos_multithread/model/github_repo.dart';

//TODO implement base network response maybe?
class ReposListResponse {
  final List<GitHubRepo>? reposList;
  final int totalCount;
  final bool isSuccess;
  final String? error;

  ReposListResponse({required this.isSuccess, List<dynamic>? reposListJson, this.error, this.totalCount = 0})
      : reposList = reposListJson?.map((dynamic json) => GitHubRepo.fromJson(json)).toList();
}
