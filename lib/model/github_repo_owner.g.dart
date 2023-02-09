// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_owner.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OwnerAdapter extends TypeAdapter<_$_Owner> {
  @override
  final int typeId = 1;

  @override
  _$_Owner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Owner(
      id: fields[0] as int,
      login: fields[1] as String,
      avatarUrl: fields[2] as String?,
      gravatarId: fields[3] as String?,
      url: fields[4] as String,
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Owner obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.login)
      ..writeByte(2)
      ..write(obj.avatarUrl)
      ..writeByte(3)
      ..write(obj.gravatarId)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Owner _$$_OwnerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
    disallowNullValues: const ['id'],
  );
  return _$_Owner(
    id: json['id'] as int,
    login: json['login'] as String? ?? '',
    avatarUrl: json['avatarUrl'] as String?,
    gravatarId: json['gravatarId'] as String?,
    url: json['url'] as String? ?? '',
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$$_OwnerToJson(_$_Owner instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      'gravatarId': instance.gravatarId,
      'url': instance.url,
      'description': instance.description,
    };
