import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/constants/palette.dart';
import 'package:github_repos_multithread/constants/strings.dart';
import 'package:github_repos_multithread/constants/styles.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_cubit.dart';

class SearchForm extends StatelessWidget {
  final TextEditingController _searchController;
  final String? searchQuery;

  SearchForm({super.key, this.searchQuery}) : _searchController = TextEditingController(text: searchQuery);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (String text) {
            context.read<ReposCubit>().search(text);
          },
          decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Palette.white, width: 0.5)),
              labelText: Strings.searchQuery,
              labelStyle: Styles.s14MainGreenW700),
          controller: _searchController,
          style: Styles.s18TextGrayW700,
        ),
      ),
      SizedBox(
        width: 200,
        child: ElevatedButton(
            child: const Text(Strings.search, style: Styles.s14MainGreenW700),
            onPressed: () {
              context.read<ReposCubit>().search(_searchController.text);
            }),
      ),
      SizedBox(
        width: 200,
        child: ElevatedButton(
            onPressed: () {
              context.read<ReposCubit>().goToFavorites();
            },
            child: const Text(Strings.goToFavorites, style: Styles.s14MainGreenW700)),
      ),
      const SizedBox(
        height: 15,
      )
    ]);
  }
}
