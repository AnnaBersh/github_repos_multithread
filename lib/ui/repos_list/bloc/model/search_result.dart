import 'package:github_repos_multithread/model/github_repo.dart';

class SearchResult {
  final List<GitHubRepo> repos;
  final int pageNumber;
  final int totalCount;

  SearchResult({required this.repos, required this.pageNumber, required this.totalCount});
}
