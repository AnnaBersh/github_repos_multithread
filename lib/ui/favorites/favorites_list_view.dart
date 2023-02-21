import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/constants/palette.dart';
import 'package:github_repos_multithread/constants/strings.dart';
import 'package:github_repos_multithread/constants/styles.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_cubit.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_state.dart';
import 'package:github_repos_multithread/ui/favorites/widgets/favorites_list.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        Strings.favoriteReposList,
        style: Styles.s18MainGreenW800,
      )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: BlocBuilder<FavoritesCubit, FavoritesState>(builder: (context, state) {
            return state.map(
              loaded: (LoadedFavoritesState value) {
                return FavoritesList(
                  repos: value.repos,
                );
              },
              loading: (LoadingFavoritesState value) {
                return _buildLoadingState();
              },
            );
          }),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
        child: CircularProgressIndicator(
      backgroundColor: Palette.accentPink15,
    ));
  }
}
