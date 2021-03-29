// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizAdapter extends TypeAdapter<Quiz> {
  @override
  final int typeId = 3;

  @override
  Quiz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quiz(
      idQuiz : fields[0] as int,
      contextQuiz : fields[1] as String,
      result : fields[2] as String,
      priority: fields[3] as int,
    );  
  }

  @override
  void write(BinaryWriter writer, Quiz obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idQuiz)
      ..writeByte(1)
      ..write(obj.contextQuiz)
      ..writeByte(2)
      ..write(obj.result)
      ..writeByte(3)
      ..write(obj.priority);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
