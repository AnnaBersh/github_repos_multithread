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

  ReposCubit() : super(const ReposState.initial());

  Future<void> search(String searchQuery) async {
    if (!_isLoading) {
      _isLoading = true;

      if (searchQuery != state.searchQuery) {
        emit(ReposState.loading(searchQuery: searchQuery));
      }

      await _loadData(searchQuery: state.searchQuery, currentPage: state.pageNumber);

      _isLoading = false;
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
    result.fold((String error) {
      emit(ReposState.error(
          errorMessage: error, searchQuery: state.searchQuery, repos: state.repos, favoriteRepos: state.favoriteRepos));
    }, (SearchResult result) {
      List<GitHubRepo> newRepos = [];
      newRepos.addAll(state.repos);
      newRepos.addAll(result.repos);

      emit(ReposState.success(
          searchQuery: state.searchQuery,
          repos: newRepos,
          pageNumber: state.pageNumber + 1,
          totalCount: result.totalCount,
          favoriteRepos: _reposRepository.getFavorites()));
    });
  }

  Future<void> loadMore() async {
    return search(state.searchQuery);
  }

  void updateFavorites() {
    emit(ReposState.success(
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
    emit(ReposState.goToFavorites(
        searchQuery: state.searchQuery,
        repos: state.repos,
        pageNumber: state.pageNumber,
        totalCount: state.totalCount));
  }
}

/// This should be called from separate isolate
Future<Either<String, SearchResult>> getReposPage(SearchCommand searchCommand) async {
  Either<String, ReposListResponse> response = await searchCommand.reposRepository
      .getReposList(searchQuery: searchCommand.searchQuery, page: searchCommand.pageNumber);
  return response.either(
      (String errorText) => errorText,
      (ReposListResponse response) => SearchResult(
          repos: response.reposList, pageNumber: searchCommand.pageNumber, totalCount: response.totalCount));
}
