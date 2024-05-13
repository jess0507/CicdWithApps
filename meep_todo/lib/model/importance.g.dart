// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'importance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImportanceAdapter extends TypeAdapter<Importance> {
  @override
  final int typeId = 2;

  @override
  Importance read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Importance.none;
      case 1:
        return Importance.low;
      case 2:
        return Importance.medium;
      case 3:
        return Importance.high;
      default:
        return Importance.none;
    }
  }

  @override
  void write(BinaryWriter writer, Importance obj) {
    switch (obj) {
      case Importance.none:
        writer.writeByte(0);
        break;
      case Importance.low:
        writer.writeByte(1);
        break;
      case Importance.medium:
        writer.writeByte(2);
        break;
      case Importance.high:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
