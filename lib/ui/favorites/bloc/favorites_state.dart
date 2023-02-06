import 'package:github_repos_multithread/model/github_repo.dart';

abstract class FavoritesState {
  final List<GitHubRepo> repos;

  FavoritesState({this.repos = const []});
}

class LoadingFavoritesState extends FavoritesState {}

class LoadedFavoritesState extends FavoritesState {
  LoadedFavoritesState({required super.repos});
}
