import 'package:hive/hive.dart';
part 'github_repo_owner.g.dart';

@HiveType(typeId: 1)
class Owner {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String login;
  @HiveField(2)
  final String? avatarUrl;
  @HiveField(3)
  final String? gravatarId;
  @HiveField(4)
  final String url;

  Owner({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
  });

  Owner.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        id = json['id'],
        avatarUrl = json['avatar_url'],
        gravatarId = json['gravatar_id'],
        url = json['url'];
}
