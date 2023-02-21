import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos_multithread/model/github_repo.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.loading() = LoadingFavoritesState;

  const factory FavoritesState.loaded({required List<GitHubRepo> repos}) = LoadedFavoritesState;
}
