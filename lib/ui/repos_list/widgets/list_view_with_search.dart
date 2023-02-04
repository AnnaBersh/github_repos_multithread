import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:github_repos_multithread/ui/repos_list/widgets/search_form.dart';

class ListViewWithSearch extends StatelessWidget {
  final List<GitHubRepo> repos;
  final String searchQuery;

  const ListViewWithSearch({super.key, required this.repos, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    log("Drawing list with ${repos.length} elements");
    List<Widget> widgets = [
      SearchForm(
        searchQuery: searchQuery,
      )
    ];
    widgets.add(Expanded(
      child: ListView.builder(
          itemCount: repos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(repos[index].name),
              subtitle: Text(repos[index].htmlUrl),
            );
          }),
    ));
    return Column(
      children: widgets,
    );
  }
}
