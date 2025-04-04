// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostModelAdapter extends TypeAdapter<PostModel> {
  @override
  final int typeId = 1;

  @override
  PostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      caption: fields[2] as String,
      imageUrl: fields[3] as String?,
      comments: (fields[4] as List).cast<CommentModel>(),
      likes: (fields[5] as List).cast<UserModel>(),
      isSimplePost: fields[6] as bool,
      createdAt: fields[7] as DateTime,
      usersInv: (fields[8] as List).cast<UserModel>(),
      username: fields[9] as String,
      userAvatar: fields[10] as String,
      category: fields[11] as String,
      postType: fields[15] as String?,
      raisedAmount: fields[13] as double?,
      status: fields[14] as String?,
      targetAmount: fields[12] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, PostModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.caption)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.comments)
      ..writeByte(5)
      ..write(obj.likes)
      ..writeByte(6)
      ..write(obj.isSimplePost)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.usersInv)
      ..writeByte(9)
      ..write(obj.username)
      ..writeByte(10)
      ..write(obj.userAvatar)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.targetAmount)
      ..writeByte(13)
      ..write(obj.raisedAmount)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.postType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
