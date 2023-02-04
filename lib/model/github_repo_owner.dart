class Owner {
  String login;
  int id;
  String? avatarUrl;
  String? gravatarId;
  String url;

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
