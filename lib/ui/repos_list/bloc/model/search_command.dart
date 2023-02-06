import 'package:github_repos_multithread/data/repos_repository.dart';

class SearchCommand {
  final String searchQuery;
  final int pageNumber;
  final ReposRepository reposRepository;

  SearchCommand({required this.searchQuery, required this.pageNumber, required this.reposRepository});
}
