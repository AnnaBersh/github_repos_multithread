import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/domain_model/github_repo.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_cubit.dart';
import 'package:github_repos_multithread/ui/repos_list/widgets/search_form.dart';
import 'package:loadmore/loadmore.dart';

class ListViewWithSearch extends StatelessWidget {
  final List<GitHubRepo> repos;
  final String searchQuery;
  final bool hasMoreData;

  const ListViewWithSearch({super.key, required this.repos, required this.searchQuery, required this.hasMoreData});

  @override
  Widget build(BuildContext context) {
    log("Drawing list with ${repos.length} elements");
    List<Widget> widgets = [
      SearchForm(
        searchQuery: searchQuery,
      )
    ];
    widgets.add(Expanded(
      child: LoadMore(
        onLoadMore: () async {
          await context.read<ReposCubit>().loadMore();
          return true;
        },
        isFinish: !hasMoreData,
        textBuilder: (LoadMoreStatus status) {
          switch (status) {
            case LoadMoreStatus.loading:
              return 'Loading next page...';
            case LoadMoreStatus.nomore:
              return 'No more data to load';
            default:
              return '';
          }
        },
        child: ListView.builder(
            itemCount: repos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(repos[index].name),
                subtitle: Text(repos[index].htmlUrl),
              );
            }),
      ),
    ));
    return Column(
      children: widgets,
    );
  }
}
