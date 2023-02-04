import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_cubit.dart';

class SearchForm extends StatelessWidget {
  final TextEditingController _searchController;
  final String? searchQuery;

  SearchForm({super.key, this.searchQuery}) : _searchController = TextEditingController(text: searchQuery);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'GitHub user name',
        ),
        controller: _searchController,
      ),
      TextButton(
          child: const Text("Search"),
          onPressed: () {
            context.read<ReposCubit>().search(_searchController.text);
          })
    ]);
  }
}
