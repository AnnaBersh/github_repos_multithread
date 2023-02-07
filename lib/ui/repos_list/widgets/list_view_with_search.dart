import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/constants/palette.dart';
import 'package:github_repos_multithread/constants/strings.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_cubit.dart';
import 'package:github_repos_multithread/ui/repos_list/widgets/search_form.dart';
import 'package:loadmore/loadmore.dart';

import '../../../constants/styles.dart';

class ListViewWithSearch extends StatelessWidget {
  final List<GitHubRepo> repos;
  final List<GitHubRepo> favoriteRepos;
  final String searchQuery;
  final bool hasMoreData;

  const ListViewWithSearch(
      {super.key,
      required this.repos,
      required this.favoriteRepos,
      required this.searchQuery,
      required this.hasMoreData});

  @override
  Widget build(BuildContext context) {
    log("Drawing list with ${repos.length} elements");
    List<Widget> widgets = [
      SearchForm(
        searchQuery: searchQuery,
      ),
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
              return Strings.loadingNextPage;
            case LoadMoreStatus.nomore:
              return Strings.noMoreData;
            default:
              return '';
          }
        },
        child: ListView.builder(
            key: const PageStorageKey('repos_page'),
            itemCount: repos.length,
            itemBuilder: (context, index) {
              GitHubRepo repo = repos[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(repo.name, style: Styles.s16TextGrayW700),
                    subtitle: Text(repo.htmlUrl, style: Styles.s14TextGrayW500Ital),
                    trailing: favoriteRepos.contains(repo)
                        ? const Icon(Icons.favorite, color: Palette.accentPink15)
                        : const Icon(Icons.favorite_outline, color: Palette.mainGreen),
                    onTap: () {
                      context.read<ReposCubit>().toggleFavorites(repo);
                    },
                  ),
                  const Divider(
                    height: 1.0,
                    color: Palette.mainGreen,
                  ),
                  const SizedBox(
                    height: 7.0,
                  )
                ],
              );
            }),
      ),
    ));
    return Column(
      children: widgets,
    );
  }
}
