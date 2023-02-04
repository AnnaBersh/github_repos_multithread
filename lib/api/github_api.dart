import 'dart:convert';
import 'dart:developer';

import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:http/http.dart' as http;

import 'model/repos_list_response.dart';

const int pageSize = 15;

Future<ReposListResponse> getReposList({String searchQuery = "test", int page = 1}) async {
  String url = 'https://api.github.com/search/repositories?per_page=$pageSize&page=$page&q=$searchQuery';
  final response = await http.get(Uri.parse(url));
  ReposListResponse result;
  if (response.statusCode == 200) {
    List<dynamic> reposJson = jsonDecode(response.body)['items'] as List<dynamic>;
    result = ReposListResponse(true, reposList: reposJson.map((dynamic json) => GitHubRepo.fromJson(json)).toList());
  } else {
    String errorText = jsonDecode(response.body)['message'] ?? 'Error message not found';
    log("API error: $errorText");
    result = ReposListResponse(false, error: errorText);
  }
  return result;
}

//{total_count: 34614, incomplete_results: false, items: [{id: 385876627, node_id: MDEwOlJlcG9zaXRvcnkzODU4NzY2Mjc=, name: ddddocr, full_name: sml2h3/ddddocr, private: false, owner: {login: sml2h3, id: 17084976, node_id: MDQ6VXNlcjE3MDg0OTc2, avatar_url: https://avatars.githubusercontent.com/u/17084976?v=4, gravatar_id: , url: https://api.github.com/users/sml2h3, html_url: https://github.com/sml2h3, followers_url: https://api.github.com/users/sml2h3/followers, following_url: https://api.github.com/users/sml2h3/following{/other_user}, gists_url: https://api.github.com/users/sml2h3/gists{/gist_id}, starred_url: https://api.github.com/users/sml2h3/starred{/owner}{/repo}, subscriptions_url: https://api.github.com/users/sml2h3/subscriptions, organizations_url: https://api.github.com/users/sml2h3/orgs, repos_url: https://api.github.com/users/sml2h3/repos, events_url: https://api.github.com/users/sml2h3/events{/privacy}, received_events_url: https://api.github.com/users/sml2h3/received_events, type: User, site_admin:
