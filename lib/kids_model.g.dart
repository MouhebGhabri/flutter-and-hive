// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kids_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KidsModelAdapter extends TypeAdapter<KidsModel> {
  @override
  final int typeId = 0;

  @override
  KidsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KidsModel(
      flname: fields[0] as String?,
      parentflname: fields[1] as String?,
      phone: fields[2] as String?,
      age: fields[3] as String?,
      yearofjoin: fields[4] as String?,
      pay: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, KidsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.flname)
      ..writeByte(1)
      ..write(obj.parentflname)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.yearofjoin)
      ..writeByte(5)
      ..write(obj.pay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KidsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
