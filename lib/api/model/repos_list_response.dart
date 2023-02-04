import 'package:github_repos_multithread/model/github_repo.dart';

class ReposListResponse {
  List<GitHubRepo>? reposList;
  bool isSuccess;
  String? error;

  ReposListResponse(this.isSuccess, {this.reposList, this.error});
}
