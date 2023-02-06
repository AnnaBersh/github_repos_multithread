import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repos_multithread/data/repos_repository.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final ReposRepository _reposRepository = GetIt.instance.get<ReposRepository>();

  FavoritesCubit() : super(LoadingFavoritesState());

  void loadData() {
    emit(LoadingFavoritesState());
    emit(LoadedFavoritesState(repos: _reposRepository.getFavorites()));
  }

  void removeFromFavorites(GitHubRepo repo) {
    _reposRepository.toggleFavorites(repo);
    emit(LoadedFavoritesState(repos: _reposRepository.getFavorites()));
  }
}
