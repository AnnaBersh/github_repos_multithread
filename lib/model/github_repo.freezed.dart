// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GitHubRepo _$GitHubRepoFromJson(Map<String, dynamic> json) {
  return _GitHubRepo.fromJson(json);
}

/// @nodoc
mixin _$GitHubRepo {
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get private => throw _privateConstructorUsedError;
  @HiveField(3)
  Owner? get owner => throw _privateConstructorUsedError;
  @HiveField(4)
  String get htmlUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GitHubRepoCopyWith<GitHubRepo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubRepoCopyWith<$Res> {
  factory $GitHubRepoCopyWith(
          GitHubRepo value, $Res Function(GitHubRepo) then) =
      _$GitHubRepoCopyWithImpl<$Res, GitHubRepo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          int id,
      @HiveField(1)
          String name,
      @HiveField(2)
          bool private,
      @HiveField(3)
          Owner? owner,
      @HiveField(4)
          String htmlUrl,
      @HiveField(5)
          String? description});

  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$GitHubRepoCopyWithImpl<$Res, $Val extends GitHubRepo>
    implements $GitHubRepoCopyWith<$Res> {
  _$GitHubRepoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? private = null,
    Object? owner = freezed,
    Object? htmlUrl = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $OwnerCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GitHubRepoCopyWith<$Res>
    implements $GitHubRepoCopyWith<$Res> {
  factory _$$_GitHubRepoCopyWith(
          _$_GitHubRepo value, $Res Function(_$_GitHubRepo) then) =
      __$$_GitHubRepoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          int id,
      @HiveField(1)
          String name,
      @HiveField(2)
          bool private,
      @HiveField(3)
          Owner? owner,
      @HiveField(4)
          String htmlUrl,
      @HiveField(5)
          String? description});

  @override
  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$_GitHubRepoCopyWithImpl<$Res>
    extends _$GitHubRepoCopyWithImpl<$Res, _$_GitHubRepo>
    implements _$$_GitHubRepoCopyWith<$Res> {
  __$$_GitHubRepoCopyWithImpl(
      _$_GitHubRepo _value, $Res Function(_$_GitHubRepo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? private = null,
    Object? owner = freezed,
    Object? htmlUrl = null,
    Object? description = freezed,
  }) {
    return _then(_$_GitHubRepo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0)
class _$_GitHubRepo implements _GitHubRepo {
  const _$_GitHubRepo(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          required this.id,
      @HiveField(1)
          this.name = '',
      @HiveField(2)
          this.private = false,
      @HiveField(3)
          this.owner,
      @HiveField(4)
          this.htmlUrl = '',
      @HiveField(5)
          this.description});

  factory _$_GitHubRepo.fromJson(Map<String, dynamic> json) =>
      _$$_GitHubRepoFromJson(json);

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  final int id;
  @override
  @JsonKey()
  @HiveField(1)
  final String name;
  @override
  @JsonKey()
  @HiveField(2)
  final bool private;
  @override
  @HiveField(3)
  final Owner? owner;
  @override
  @JsonKey()
  @HiveField(4)
  final String htmlUrl;
  @override
  @HiveField(5)
  final String? description;

  @override
  String toString() {
    return 'GitHubRepo(id: $id, name: $name, private: $private, owner: $owner, htmlUrl: $htmlUrl, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GitHubRepo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, private, owner, htmlUrl, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GitHubRepoCopyWith<_$_GitHubRepo> get copyWith =>
      __$$_GitHubRepoCopyWithImpl<_$_GitHubRepo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GitHubRepoToJson(
      this,
    );
  }
}

abstract class _GitHubRepo implements GitHubRepo {
  const factory _GitHubRepo(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          required final int id,
      @HiveField(1)
          final String name,
      @HiveField(2)
          final bool private,
      @HiveField(3)
          final Owner? owner,
      @HiveField(4)
          final String htmlUrl,
      @HiveField(5)
          final String? description}) = _$_GitHubRepo;

  factory _GitHubRepo.fromJson(Map<String, dynamic> json) =
      _$_GitHubRepo.fromJson;

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  bool get private;
  @override
  @HiveField(3)
  Owner? get owner;
  @override
  @HiveField(4)
  String get htmlUrl;
  @override
  @HiveField(5)
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_GitHubRepoCopyWith<_$_GitHubRepo> get copyWith =>
      throw _privateConstructorUsedError;
}
