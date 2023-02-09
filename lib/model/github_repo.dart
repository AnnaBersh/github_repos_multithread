import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'github_repo_owner.dart';

part 'github_repo.freezed.dart';
part 'github_repo.g.dart';

@freezed
class GitHubRepo with _$GitHubRepo {
  @HiveType(typeId: 0)
  const factory GitHubRepo(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) required final int id,
      @HiveField(1) @Default('') final String name,
      @HiveField(2) @Default(false) final bool private,
      @HiveField(3) final Owner? owner,
      @HiveField(4) @Default('') final String htmlUrl,
      @HiveField(5) final String? description}) = _GitHubRepo;

  factory GitHubRepo.fromJson(Map<String, dynamic> json) => _$GitHubRepoFromJson(json);
}
