import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_cubit.dart';

class FavoritesList extends StatelessWidget {
  final List<GitHubRepo> repos;

  const FavoritesList({super.key, required this.repos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          GitHubRepo repo = repos[index];
          return ListTile(
            title: Text(repo.name),
            subtitle: Text(repo.htmlUrl),
            trailing: const IconButton(onPressed: null, icon: Icon(Icons.favorite)),
            onTap: () {
              context.read<FavoritesCubit>().removeFromFavorites(repo);
            },
          );
        });
  }
}
