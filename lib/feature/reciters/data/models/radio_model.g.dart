// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RadioModelAdapter extends TypeAdapter<RadioModel> {
  @override
  final int typeId = 0;

  @override
  RadioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RadioModel(
      name: fields[0] as String,
      url: fields[1] as String,
       isFavorite: (fields[2] as bool?) ?? false, // يمنع null
  isRepeating: (fields[3] as bool?) ?? false, // يمنع null
      // isFavorite: fields[2] as bool,
      // isRepeating: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RadioModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.isFavorite)
      ..writeByte(3)
      ..write(obj.isRepeating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RadioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
