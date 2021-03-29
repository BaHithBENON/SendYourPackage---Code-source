// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      nameUser : fields[1] as String,
      coinsUser : fields[2] as int,
      starsUser : fields[3] as int,
      focusUser : fields[4] as int,
      progressUser : fields[5] as double,
      lifeUser : fields[6] as int,
      highScore : fields[7] as int,
      hadStarted : fields[8] as bool,
    )..idUser = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.idUser)
      ..writeByte(1)
      ..write(obj.nameUser)
      ..writeByte(2)
      ..write(obj.coinsUser)
      ..writeByte(3)
      ..write(obj.starsUser)
      ..writeByte(4)
      ..write(obj.focusUser)
      ..writeByte(5)
      ..write(obj.progressUser)
      ..writeByte(6)
      ..write(obj.lifeUser)
      ..writeByte(7)
      ..write(obj.highScore)
      ..writeByte(8)
      ..write(obj.hadStarted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
