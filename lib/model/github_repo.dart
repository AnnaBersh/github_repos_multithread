import 'github_repo_owner.dart';

class GitHubRepo {
  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  Owner? owner;
  String htmlUrl;
  String? description;

  GitHubRepo(
      {required this.id,
      required this.nodeId,
      required this.name,
      required this.fullName,
      required this.private,
      this.owner,
      required this.htmlUrl,
      this.description});

  GitHubRepo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nodeId = json['node_id'],
        name = json['name'],
        fullName = json['full_name'],
        private = json['private'],
        owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null,
        htmlUrl = json['html_url'],
        description = json['description'];
}
