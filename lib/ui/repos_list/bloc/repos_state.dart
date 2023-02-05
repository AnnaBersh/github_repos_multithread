

import 'package:github_repos_multithread/model/github_repo.dart';

abstract class ReposState {
  final String searchQuery;
  final int pageNumber; // as we always increase pageNumber before making request
                        // and min page for github is 1 it has to start from 0 here
  final int totalCount;
  final List<GitHubRepo> repos;

  ReposState({this.searchQuery = '', this.pageNumber = 0, this.repos = const [], this.totalCount = 0});
}

class ReposInitialState extends ReposState {
  ReposInitialState({String searchQuery = ''}) : super(searchQuery: searchQuery);
}

class ReposSuccessState extends ReposState {
  ReposSuccessState(
      {required String searchQuery, required List<GitHubRepo> repos, required int pageNumber, required int totalCount})
      : super(searchQuery: searchQuery, pageNumber: pageNumber, repos: repos, totalCount: totalCount);
}

class ReposLoadingState extends ReposState {
  ReposLoadingState(
      {required String searchQuery, int pageNumber = 0, List<GitHubRepo> repos = const [], int totalCount = 0})
      : super(searchQuery: searchQuery, pageNumber: pageNumber, repos: repos, totalCount: totalCount);
}

class ReposErrorState extends ReposState {
  final String errorMessage;

  ReposErrorState({required this.errorMessage, String searchQuery = '', int pageNumber = 0, int totalCount = 0})
      : super(searchQuery: searchQuery, pageNumber: pageNumber, totalCount: totalCount);
}
