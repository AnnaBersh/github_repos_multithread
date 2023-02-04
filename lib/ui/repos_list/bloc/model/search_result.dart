import 'package:github_repos_multithread/domain_model/github_repo.dart';

class SearchResult {
  final List<GitHubRepo> repos;
  final int pageNumber;
  final int totalCount;

  SearchResult({required this.repos, required this.pageNumber, required this.totalCount});
}
