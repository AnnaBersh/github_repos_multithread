import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_cubit.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_state.dart';
import 'package:github_repos_multithread/ui/favorites/widgets/favorites_list.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite repos list')),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case LoadingFavoritesState:
                    return _buildLoadingState();
                  case LoadedFavoritesState:
                    return FavoritesList(
                      repos: state.repos,
                    );
                  default:
                    return _buildLoadingState();
                }
              },
            ),
          )),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }
}
