import 'package:github_repos_multithread/domain_model/github_repo.dart';

class ReposListResponse {
  final List<GitHubRepo>? reposList;
  final int totalCount;
  final bool isSuccess;
  final String? error;

  ReposListResponse(this.isSuccess, {this.reposList, this.error, this.totalCount = 0});
}
