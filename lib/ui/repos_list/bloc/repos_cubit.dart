import 'dart:developer';

import 'package:async/async.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/data/github_api.dart';
import 'package:github_repos_multithread/data/model/repos_list_response.dart';
import 'package:github_repos_multithread/domain_model/github_repo.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/model/search_command.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/model/search_result.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_state.dart';

class ReposCubit extends Cubit<ReposState> {
  bool isLoading = false;

  ReposCubit() : super(ReposInitialState());

  void search(String searchQuery) {
    if (!isLoading) {
      isLoading = true;
      log("New search. Invalidating results");
      emit(ReposInitialState(searchQuery: searchQuery));
      log("----------------------");
      log("Loading iteration started");

      final int currentPage = state.pageNumber;

      emit(ReposLoadingState(searchQuery: searchQuery, pageNumber: currentPage + 2, repos: state.repos));

      _loadData(searchQuery: searchQuery, currentPage: currentPage).then((value) {
        isLoading = false;
        log("Loading iteration done");
        log("----------------------");
      });
    }
  }

  Future<void> _loadData({required String searchQuery, required int currentPage}) {
    FutureGroup futureGroup = FutureGroup();
    futureGroup.add(compute(getReposListThread, SearchCommand(searchQuery: searchQuery, pageNumber: currentPage + 1))
        .then(_handleSearchResultFromThread));
    futureGroup.add(compute(getReposListThread, SearchCommand(searchQuery: searchQuery, pageNumber: currentPage + 2))
        .then(_handleSearchResultFromThread));
    futureGroup.close();
    return futureGroup.future;
  }

  Future<void> loadMore() async {
    if (!isLoading) {
      isLoading = true;
      log("----------------------");
      log("Loading iteration started");

      await _loadData(searchQuery: state.searchQuery, currentPage: state.pageNumber);
      //TODO Need to update page number in a better way
      emit(ReposSuccessState(
          searchQuery: state.searchQuery,
          repos: state.repos,
          pageNumber: state.pageNumber + 2,
          totalCount: state.totalCount));
      isLoading = false;
      log("Loading iteration done");
      log("----------------------");
    }
  }

  void _handleSearchResultFromThread(Either<String, SearchResult> result) {
    log("Handling response");
    result.fold((String error) {
      emit(ReposErrorState(errorMessage: error));
    }, (SearchResult result) {
      log("Handling success for page ${result.pageNumber}");

      List<GitHubRepo> newRepos = [];
      newRepos.addAll(state.repos);
      newRepos.addAll(result.repos);

      log("New repos length: ${newRepos.length}");

      emit(ReposSuccessState(
          searchQuery: state.searchQuery,
          repos: newRepos,
          pageNumber: state.pageNumber,
          totalCount: result.totalCount));

      log("New state page: ${state.pageNumber}");
    });
  }
}

Future<Either<String, SearchResult>> getReposListThread(SearchCommand searchCommand) async {
  ReposListResponse response =
      await getReposList(searchQuery: searchCommand.searchQuery, page: searchCommand.pageNumber);
  if (response.isSuccess) {
    return Right(SearchResult(
        repos: response.reposList ?? [], pageNumber: searchCommand.pageNumber, totalCount: response.totalCount));
  } else {
    return Left(response.error ?? 'Unknown error');
  }
}
