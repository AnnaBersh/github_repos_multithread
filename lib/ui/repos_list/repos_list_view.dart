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
                state.maybeMap(
                    orElse: () {},
                    error: (ReposStateError value) {
                      Fluttertoast.showToast(
                        msg: value.errorMessage,
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 16.0,
                        backgroundColor: Palette.white,
                        textColor: Palette.mainGreen,
                      );
                    },
                    goToFavorites: (ReposStateGoToFavorites value) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const FavoritesListScreen()))
                          .then((value) => context.read<ReposCubit>().updateFavorites());
                    });
              },
              builder: (context, state) {
                return state.maybeMap(orElse: () {
                  return SearchForm();
                }, success: (ReposStateSuccess value) {
                  return ListViewWithSearch(
                    repos: value.repos,
                    favoriteRepos: value.favoriteRepos,
                    searchQuery: value.searchQuery,
                    hasMoreData: value.totalCount > value.repos.length,
                  );
                }, loading: (ReposStateLoading value) {
                  return _buildLoadingState(searchQuery: value.searchQuery);
                });
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
