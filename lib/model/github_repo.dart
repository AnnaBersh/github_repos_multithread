import 'package:hive/hive.dart';

import 'github_repo_owner.dart';

part 'github_repo.g.dart';

@HiveType(typeId: 0)
class GitHubRepo {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool private;
  @HiveField(3)
  final Owner? owner;
  @HiveField(4)
  final String htmlUrl;
  @HiveField(5)
  final String? description;

  GitHubRepo(
      {required this.id,
      required this.name,
      required this.private,
      this.owner,
      required this.htmlUrl,
      this.description});

  GitHubRepo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        private = json['private'],
        owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null,
        htmlUrl = json['html_url'],
        description = json['description'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitHubRepo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          owner == other.owner;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ owner.hashCode;
}
