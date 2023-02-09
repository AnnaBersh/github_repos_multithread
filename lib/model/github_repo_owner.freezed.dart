// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repo_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return _Owner.fromJson(json);
}

/// @nodoc
mixin _$Owner {
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get login => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get avatarUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get gravatarId => throw _privateConstructorUsedError;
  @HiveField(4)
  String get url => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerCopyWith<Owner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerCopyWith<$Res> {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) then) =
      _$OwnerCopyWithImpl<$Res, Owner>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          int id,
      @HiveField(1)
          String login,
      @HiveField(2)
          String? avatarUrl,
      @HiveField(3)
          String? gravatarId,
      @HiveField(4)
          String url,
      @HiveField(5)
          String? description});
}

/// @nodoc
class _$OwnerCopyWithImpl<$Res, $Val extends Owner>
    implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = freezed,
    Object? gravatarId = freezed,
    Object? url = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gravatarId: freezed == gravatarId
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OwnerCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$$_OwnerCopyWith(_$_Owner value, $Res Function(_$_Owner) then) =
      __$$_OwnerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          int id,
      @HiveField(1)
          String login,
      @HiveField(2)
          String? avatarUrl,
      @HiveField(3)
          String? gravatarId,
      @HiveField(4)
          String url,
      @HiveField(5)
          String? description});
}

/// @nodoc
class __$$_OwnerCopyWithImpl<$Res> extends _$OwnerCopyWithImpl<$Res, _$_Owner>
    implements _$$_OwnerCopyWith<$Res> {
  __$$_OwnerCopyWithImpl(_$_Owner _value, $Res Function(_$_Owner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = freezed,
    Object? gravatarId = freezed,
    Object? url = null,
    Object? description = freezed,
  }) {
    return _then(_$_Owner(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gravatarId: freezed == gravatarId
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
@HiveType(typeId: 1)
class _$_Owner implements _Owner {
  const _$_Owner(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          required this.id,
      @HiveField(1)
          this.login = '',
      @HiveField(2)
          this.avatarUrl,
      @HiveField(3)
          this.gravatarId,
      @HiveField(4)
          this.url = '',
      @HiveField(5)
          this.description});

  factory _$_Owner.fromJson(Map<String, dynamic> json) =>
      _$$_OwnerFromJson(json);

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  final int id;
  @override
  @JsonKey()
  @HiveField(1)
  final String login;
  @override
  @HiveField(2)
  final String? avatarUrl;
  @override
  @HiveField(3)
  final String? gravatarId;
  @override
  @JsonKey()
  @HiveField(4)
  final String url;
  @override
  @HiveField(5)
  final String? description;

  @override
  String toString() {
    return 'Owner(id: $id, login: $login, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Owner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.gravatarId, gravatarId) ||
                other.gravatarId == gravatarId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, login, avatarUrl, gravatarId, url, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OwnerCopyWith<_$_Owner> get copyWith =>
      __$$_OwnerCopyWithImpl<_$_Owner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OwnerToJson(
      this,
    );
  }
}

abstract class _Owner implements Owner {
  const factory _Owner(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      @HiveField(0)
          required final int id,
      @HiveField(1)
          final String login,
      @HiveField(2)
          final String? avatarUrl,
      @HiveField(3)
          final String? gravatarId,
      @HiveField(4)
          final String url,
      @HiveField(5)
          final String? description}) = _$_Owner;

  factory _Owner.fromJson(Map<String, dynamic> json) = _$_Owner.fromJson;

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get login;
  @override
  @HiveField(2)
  String? get avatarUrl;
  @override
  @HiveField(3)
  String? get gravatarId;
  @override
  @HiveField(4)
  String get url;
  @override
  @HiveField(5)
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_OwnerCopyWith<_$_Owner> get copyWith =>
      throw _privateConstructorUsedError;
}
