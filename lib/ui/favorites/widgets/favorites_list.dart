import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/constants/palette.dart';
import 'package:github_repos_multithread/constants/styles.dart';
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
          return Column(
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(repo.name, style: Styles.s16TextGrayW700),
                ),
                subtitle: Text(repo.htmlUrl, style: Styles.s14TextGrayW500Ital),
                trailing: const Icon(
                  Icons.delete,
                  color: Palette.mainGreen,
                ),
                onTap: () {
                  context.read<FavoritesCubit>().removeFromFavorites(repo);
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
        });
  }
}
