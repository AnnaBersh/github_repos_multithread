import 'github_repo.dart';

class SearchResult {
  final List<GitHubRepo> repos;
  final int pageNumber;

  SearchResult({required this.repos, required this.pageNumber});
}
