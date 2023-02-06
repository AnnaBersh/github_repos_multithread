import 'dart:developer';

import 'package:async/async.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repos_multithread/data/repos_repository.dart';
import 'package:github_repos_multithread/model/api/repos_list_response.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/model/search_command.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/model/search_result.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_state.dart';

class ReposCubit extends Cubit<ReposState> {
  bool _isLoading = false;
  final ReposRepository _reposRepository = GetIt.instance.get<ReposRepository>();

  ReposCubit() : super(ReposInitialState());

  Future<void> search(String searchQuery) async {
    if (!_isLoading) {
      _isLoading = true;

      if (searchQuery != state.searchQuery) {
        log("New search. Invalidating results");
        emit(ReposLoadingState(searchQuery: searchQuery));
      }
      log("----------------------");
      log("Loading iteration started");

      await _loadData(searchQuery: state.searchQuery, currentPage: state.pageNumber);

      _isLoading = false;
      log("Loading iteration done");
      log("----------------------");
    }
  }

  Future<void> _loadData({required String searchQuery, required int currentPage}) {
    FutureGroup futureGroup = FutureGroup();
    futureGroup.add(compute(getReposPage,
            SearchCommand(searchQuery: searchQuery, reposRepository: _reposRepository, pageNumber: currentPage + 1))
        .then(_handleSearchResultFromThread));
    futureGroup.add(compute(getReposPage,
            SearchCommand(searchQuery: searchQuery, reposRepository: _reposRepository, pageNumber: currentPage + 2))
        .then(_handleSearchResultFromThread));
    futureGroup.close();
    return futureGroup.future;
  }

  void _handleSearchResultFromThread(Either<String, SearchResult> result) {
    log("Handling response");
    result.fold((String error) {
      emit(ReposErrorState(
          errorMessage: error, searchQuery: state.searchQuery, repos: state.repos, favoriteRepos: state.favoriteRepos));
    }, (SearchResult result) {
      log("Handling success for page ${result.pageNumber}");

      List<GitHubRepo> newRepos = [];
      newRepos.addAll(state.repos);
      newRepos.addAll(result.repos);

      log("New repos length: ${newRepos.length}");

      emit(ReposSuccessState(
          searchQuery: state.searchQuery,
          repos: newRepos,
          pageNumber: state.pageNumber + 1,
          totalCount: result.totalCount,
          favoriteRepos: _reposRepository.getFavorites()));

      log("New state page: ${state.pageNumber}");
    });
  }

  Future<void> loadMore() async {
    return search(state.searchQuery);
  }

  void updateFavorites() {
    emit(ReposSuccessState(
        searchQuery: state.searchQuery,
        repos: state.repos,
        pageNumber: state.pageNumber + 1,
        totalCount: state.totalCount,
        favoriteRepos: _reposRepository.getFavorites()));
  }

  void toggleFavorites(GitHubRepo repo) {
    _reposRepository.toggleFavorites(repo);
    updateFavorites();
  }

  void goToFavorites() {
    emit(GoToFavoritesState(
        searchQuery: state.searchQuery,
        repos: state.repos,
        pageNumber: state.pageNumber,
        totalCount: state.totalCount));
  }
}

/// This should be called from separate isolate
Future<Either<String, SearchResult>> getReposPage(SearchCommand searchCommand) async {
  ReposListResponse response = await searchCommand.reposRepository
      .getReposList(searchQuery: searchCommand.searchQuery, page: searchCommand.pageNumber);
  if (response.isSuccess) {
    return Right(SearchResult(
        repos: response.reposList ?? [], pageNumber: searchCommand.pageNumber, totalCount: response.totalCount));
  } else {
    return Left(response.error ?? 'Unknown error');
  }
}
