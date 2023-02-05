import 'package:get_it/get_it.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:hive/hive.dart';

const String likedReposBox = 'likedReposBox';

class ReposRepository {
  ReposRepository() {
    Hive.openBox<GitHubRepo>(likedReposBox).then((value) => GetIt.instance.signalReady(this));
  }

  void toggleFavorites(GitHubRepo repo) {
    Box<GitHubRepo> box = Hive.box<GitHubRepo>(likedReposBox);
    if (isFavorite(repo)) {
      box.delete(repo.id);
    } else {
      box.put(repo.id, repo);
    }
  }

  List<GitHubRepo> getFavorites() {
    Box<GitHubRepo> box = Hive.box<GitHubRepo>(likedReposBox);
    return box.values.toList();
  }

  bool isFavorite(GitHubRepo repo) {
    return Hive.box<GitHubRepo>(likedReposBox).containsKey(repo.id);
  }
}
