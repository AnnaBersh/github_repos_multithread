// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GitHubRepoAdapter extends TypeAdapter<GitHubRepo> {
  @override
  final int typeId = 0;

  @override
  GitHubRepo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GitHubRepo(
      id: fields[0] as int,
      name: fields[1] as String,
      private: fields[2] as bool,
      owner: fields[3] as Owner?,
      htmlUrl: fields[4] as String,
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GitHubRepo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.private)
      ..writeByte(3)
      ..write(obj.owner)
      ..writeByte(4)
      ..write(obj.htmlUrl)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitHubRepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
