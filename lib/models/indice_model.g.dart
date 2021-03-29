// GENERATED CODE - DO NOT MODIFY BY HAND












part of 'indice_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IndiceAdapter extends TypeAdapter<Indice> {
  @override
  final int typeId = 2;

  @override
  Indice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Indice(
      idIndice: fields[0] as int,
      contextIndice: fields[1] as String,
      img: fields[2] as String,
      result: fields[3] as int,
      infobonus:  fields[4] as String,
      coins: fields[5] as int,
      indiceResult:  fields[6] as String,
      quizLines: fields[7] as List<String>,
    );
  }

  @override
  void write(BinaryWriter writer, Indice obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.idIndice)
      ..writeByte(1)
      ..write(obj.contextIndice)
      ..writeByte(2)
      ..write(obj.img)
      ..writeByte(3)
      ..write(obj.result)
      ..writeByte(4)
      ..write(obj.infobonus)
      ..writeByte(5)
      ..write(obj.coins)
      ..writeByte(6)
      ..write(obj.indiceResult)
      ..writeByte(7)
      ..write(obj.quizLines)
      ..writeByte(8)
      ..write(obj.quizList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
