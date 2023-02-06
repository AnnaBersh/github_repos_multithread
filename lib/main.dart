import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repos_multithread/data/github_api.dart';
import 'package:github_repos_multithread/data/repos_repository.dart';
import 'package:github_repos_multithread/model/github_repo_owner.dart';
import 'package:github_repos_multithread/ui/repos_list/repos_list_screen.dart';
import 'package:hive_flutter/adapters.dart';

import 'model/github_repo.dart';

void main() async {
  await initDb();
  initDi();
  runApp(const MyApp());
}

Future<void> initDb() async {
  await Hive.initFlutter();
  Hive.registerAdapter(OwnerAdapter());
  Hive.registerAdapter(GitHubRepoAdapter());
}

void initDi() {
  GetIt.instance.registerSingleton<GithubApi>(GithubApi());
  GetIt.instance.registerSingleton<ReposRepository>(ReposRepository(), signalsReady: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReposListScreen(),
    );
  }
}
