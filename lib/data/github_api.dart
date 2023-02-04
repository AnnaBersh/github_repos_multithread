import 'dart:convert';
import 'dart:developer';

import 'package:github_repos_multithread/domain_model/github_repo.dart';
import 'package:http/http.dart' as http;

import 'model/repos_list_response.dart';

const int pageSize = 15;

Future<ReposListResponse> getReposList({String searchQuery = "test", int page = 1}) async {
  String url = 'https://api.github.com/search/repositories?per_page=$pageSize&page=$page&q=$searchQuery';
  final response = await http.get(Uri.parse(url));
  ReposListResponse result;
  if (response.statusCode == 200) {
    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    List<dynamic> reposJson = decodedResponse['items'] as List<dynamic>;
    result = ReposListResponse(true,
        reposList: reposJson.map((dynamic json) => GitHubRepo.fromJson(json)).toList(),
        totalCount: decodedResponse['total_count'] ?? 0);
  } else {
    String errorText = jsonDecode(response.body)['message'] ?? 'Error message not found';
    log("API error: $errorText");
    result = ReposListResponse(false, error: errorText);
  }
  return result;
}
