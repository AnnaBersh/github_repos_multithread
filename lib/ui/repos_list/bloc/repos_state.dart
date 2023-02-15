import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos_multithread/model/github_repo.dart';

part 'repos_state.freezed.dart';

@freezed
class ReposState with _$ReposState {
  const factory ReposState.initial(
      {@Default('') String searchQuery,
      @Default([]) List<GitHubRepo> repos,
      @Default([]) List<GitHubRepo> favoriteRepos,
      @Default(0) int pageNumber,
      @Default(0) int totalCount}) = ReposStateInitial;

  const factory ReposState.success(
      {required String searchQuery,
      required List<GitHubRepo> repos,
      required List<GitHubRepo> favoriteRepos,
      required int pageNumber,
      required int totalCount}) = ReposStateSuccess;

  const factory ReposState.loading(
      {@Default('') String searchQuery,
      @Default([]) List<GitHubRepo> repos,
      @Default([]) List<GitHubRepo> favoriteRepos,
      @Default(0) int pageNumber,
      @Default(0) int totalCount}) = ReposStateLoading;

  const factory ReposState.error(
      {required String errorMessage,
      @Default('') String searchQuery,
      @Default([]) List<GitHubRepo> repos,
      @Default([]) List<GitHubRepo> favoriteRepos,
      @Default(0) int pageNumber,
      @Default(0) int totalCount}) = ReposStateError;

  const factory ReposState.goToFavorites(
      {@Default('') String searchQuery,
      @Default([]) List<GitHubRepo> repos,
      @Default([]) List<GitHubRepo> favoriteRepos,
      @Default(0) int pageNumber,
      @Default(0) int totalCount}) = ReposStateGoToFavorites;
}