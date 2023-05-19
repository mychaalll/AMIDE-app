// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elderly.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElderlyAdapter extends TypeAdapter<Elderly> {
  @override
  final int typeId = 0;

  @override
  Elderly read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Elderly(
        name: fields[0] as String,
        age: fields[1] as int,
        sex: fields[2] as String,
        description: fields[3] as String?,
        bloodType: fields[4] as String,
        height: fields[5] as double,
        weight: fields[6] as double,
        id: fields[7] as String);
  }

  @override
  void write(BinaryWriter writer, Elderly obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.sex)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.bloodType)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ElderlyAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
