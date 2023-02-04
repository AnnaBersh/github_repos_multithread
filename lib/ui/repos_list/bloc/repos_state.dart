import 'package:github_repos_multithread/model/github_repo.dart';

abstract class ReposState {
  final String searchQuery;
  final int pageNumber;
  final List<GitHubRepo> repos;

  ReposState({this.searchQuery = '', this.pageNumber = 0, this.repos = const []});
}

class ReposInitialState extends ReposState {
  ReposInitialState({String searchQuery = ''}) : super(searchQuery: searchQuery);
}

class ReposSuccessState extends ReposState {
  ReposSuccessState({required String searchQuery, required List<GitHubRepo> repos, required int pageNumber})
      : super(searchQuery: searchQuery, pageNumber: pageNumber, repos: repos);
}

class ReposLoadingState extends ReposState {
  ReposLoadingState({required String searchQuery, int pageNumber = 0, List<GitHubRepo> repos = const []})
      : super(searchQuery: searchQuery, pageNumber: pageNumber, repos: repos);
}

class ReposErrorState extends ReposState {
  final String errorMessage;

  ReposErrorState({required this.errorMessage, String searchQuery = '', int pageNumber = 0})
      : super(searchQuery: searchQuery, pageNumber: pageNumber);
}
