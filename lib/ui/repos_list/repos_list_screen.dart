import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_multithread/ui/repos_list/repos_list_view.dart';

import 'bloc/repos_cubit.dart';

class ReposListScreen extends StatelessWidget {
  const ReposListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReposCubit(),
      child: const ReposListView(),
    );
  }
}
