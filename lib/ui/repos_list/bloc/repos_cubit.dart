import 'dart:developer';

import 'package:async/async.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/api/github_api.dart';
import 'package:github_repos_multithread/api/model/repos_list_response.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:github_repos_multithread/model/search_command.dart';
import 'package:github_repos_multithread/model/search_result.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_state.dart';

class ReposCubit extends Cubit<ReposState> {
  bool isLoading = false;

  ReposCubit() : super(ReposInitialState());

  void search(String searchQuery) {
    if (searchQuery != state.searchQuery) {
      log("Search query changed. Invalidating results");
      emit(ReposInitialState(searchQuery: searchQuery));
    }

    if (!isLoading) {
      log("----------------------");
      log("Loading iteration started");

      isLoading = true;
      final int currentPage = state.pageNumber;

      emit(ReposLoadingState(searchQuery: searchQuery, pageNumber: currentPage + 2, repos: state.repos));

      FutureGroup futureGroup = FutureGroup();
      futureGroup.add(compute(getReposListThread, SearchCommand(searchQuery: searchQuery, pageNumber: currentPage + 1))
          .then(_handleSearchResult));
      futureGroup.add(compute(getReposListThread, SearchCommand(searchQuery: searchQuery, pageNumber: currentPage + 2))
          .then(_handleSearchResult));
      futureGroup.close();

      futureGroup.future.then((value) {
        isLoading = false;
        log("Loading iteration done");
        log("----------------------");
      });
    }
  }

  void _handleSearchResult(Either<String, SearchResult> result) {
    log("Handling response");
    result.fold((String error) {
      emit(ReposErrorState(errorMessage: error));
    }, (SearchResult result) {
      log("Handling success for page ${result.pageNumber}");
      if (result.repos.isNotEmpty) {
        List<GitHubRepo> newRepos = [];
        newRepos.addAll(state.repos);
        newRepos.addAll(result.repos);
        log("New repos length: ${newRepos.length}");
        emit(ReposSuccessState(searchQuery: state.searchQuery, repos: newRepos, pageNumber: state.pageNumber));
        log("New state page: ${state.pageNumber}");
      }
    });
  }
}

Future<Either<String, SearchResult>> getReposListThread(SearchCommand searchCommand) async {
  ReposListResponse response =
      await getReposList(searchQuery: searchCommand.searchQuery, page: searchCommand.pageNumber);
  if (response.isSuccess) {
    return Right(SearchResult(repos: response.reposList ?? [], pageNumber: searchCommand.pageNumber));
  } else {
    return Left(response.error ?? 'Unknown error');
  }
}
