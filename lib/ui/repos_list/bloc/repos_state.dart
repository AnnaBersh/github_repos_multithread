import 'package:github_repos_multithread/model/github_repo.dart';

abstract class ReposState {
  // as we always increase pageNumber before making request
  // and min page for github is 1 it has to start from 0 here. See constructor
  final int pageNumber;
  final String searchQuery;
  final int totalCount;
  final List<GitHubRepo> repos;
  final List<GitHubRepo> favoriteRepos;

  ReposState(
      {this.searchQuery = '',
      this.pageNumber = 0,
      this.repos = const [],
      this.favoriteRepos = const [],
      this.totalCount = 0});
}

class ReposInitialState extends ReposState {
  ReposInitialState({super.searchQuery});
}

class ReposSuccessState extends ReposState {
  ReposSuccessState(
      {required super.searchQuery,
      required super.repos,
      required super.favoriteRepos,
      required super.pageNumber,
      required super.totalCount});
}

class ReposLoadingState extends ReposState {
  ReposLoadingState({super.searchQuery});
}

class ReposErrorState extends ReposState {
  final String errorMessage;

  ReposErrorState(
      {required this.errorMessage,
      super.searchQuery,
      super.repos,
      super.favoriteRepos,
      super.pageNumber,
      super.totalCount});
}

class GoToFavoritesState extends ReposState {
  GoToFavoritesState({super.searchQuery, super.repos, super.favoriteRepos, super.pageNumber, super.totalCount});
}
