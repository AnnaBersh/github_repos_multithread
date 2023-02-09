import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'github_repo_owner.freezed.dart';
part 'github_repo_owner.g.dart';

@freezed
class Owner with _$Owner {
  @HiveType(typeId: 1)
  const factory Owner(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) required final int id,
      @HiveField(1) @Default('') final String login,
      @HiveField(2) final String? avatarUrl,
      @HiveField(3) final String? gravatarId,
      @HiveField(4) @Default('') final String url,
      @HiveField(5) final String? description}) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
