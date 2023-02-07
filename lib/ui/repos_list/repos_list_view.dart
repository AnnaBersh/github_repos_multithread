import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_repos_multithread/constants/palette.dart';
import 'package:github_repos_multithread/constants/strings.dart';
import 'package:github_repos_multithread/constants/styles.dart';
import 'package:github_repos_multithread/ui/favorites/favorites_list_screen.dart';
import 'package:github_repos_multithread/ui/repos_list/widgets/list_view_with_search.dart';
import 'package:github_repos_multithread/ui/repos_list/widgets/search_form.dart';

import 'bloc/repos_cubit.dart';
import 'bloc/repos_state.dart';

class ReposListView extends StatelessWidget {
  const ReposListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        Strings.gitHubReposList,
        style: Styles.s18MainGreenW800,
      )),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: BlocConsumer<ReposCubit, ReposState>(
              listener: (context, state) {
                switch (state.runtimeType) {
                  case ReposErrorState:
                    Fluttertoast.showToast(
                      msg: (state as ReposErrorState).errorMessage,
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 16.0,
                      backgroundColor: Palette.white,
                      textColor: Palette.mainGreen,
                    );
                    break;
                  case GoToFavoritesState:
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const FavoritesListScreen()))
                        .then((value) => context.read<ReposCubit>().updateFavorites());
                    break;
                }
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ReposLoadingState:
                    return _buildLoadingState(searchQuery: state.searchQuery);
                  case ReposSuccessState:
                    return ListViewWithSearch(
                      repos: state.repos,
                      favoriteRepos: state.favoriteRepos,
                      searchQuery: state.searchQuery,
                      hasMoreData: state.totalCount > state.repos.length,
                    );
                  default:
                    return SearchForm();
                }
              },
            ),
          )),
    );
  }

  Widget _buildLoadingState({required String searchQuery}) {
    return Column(
      children: [
        SearchForm(
          searchQuery: searchQuery,
        ),
        const CircularProgressIndicator(
          backgroundColor: Palette.accentPink15,
        )
      ],
    );
  }
}
