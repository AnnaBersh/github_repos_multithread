import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_cubit.dart';
import 'package:github_repos_multithread/ui/favorites/favorites_list_view.dart';

class FavoritesListScreen extends StatelessWidget {
  const FavoritesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesCubit()..loadData(),
      child: const FavoritesListView(),
    );
  }
}
