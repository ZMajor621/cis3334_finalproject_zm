// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServantAdapter extends TypeAdapter<Servant> {
  @override
  final int typeId = 0;

  @override
  Servant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Servant(
      id: fields[0] as String?,
      name: fields[1] as String,
      servantClass: fields[2] as int,
      hp: fields[3] as String,
      attack: fields[4] as String,
      noblePhantasmCard: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Servant obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.servantClass)
      ..writeByte(3)
      ..write(obj.hp)
      ..writeByte(4)
      ..write(obj.attack)
      ..writeByte(5)
      ..write(obj.noblePhantasmCard);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
