// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_log_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppLogAdapter extends TypeAdapter<AppLog> {
  @override
  final int typeId = 0;

  @override
  AppLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppLog(
      fields[0] as DateTime,
      fields[1] as String,
      type: fields[2] as AppLogType,
    );
  }

  @override
  void write(BinaryWriter writer, AppLog obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppLogTypeAdapter extends TypeAdapter<AppLogType> {
  @override
  final int typeId = 2;

  @override
  AppLogType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppLogType.info;
      case 1:
        return AppLogType.warning;
      case 2:
        return AppLogType.error;
      case 3:
        return AppLogType.wtf;
      case 4:
        return AppLogType.tap;
      case 5:
        return AppLogType.navigation;
      case 6:
        return AppLogType.network;
      default:
        return AppLogType.info;
    }
  }

  @override
  void write(BinaryWriter writer, AppLogType obj) {
    switch (obj) {
      case AppLogType.info:
        writer.writeByte(0);
        break;
      case AppLogType.warning:
        writer.writeByte(1);
        break;
      case AppLogType.error:
        writer.writeByte(2);
        break;
      case AppLogType.wtf:
        writer.writeByte(3);
        break;
      case AppLogType.tap:
        writer.writeByte(4);
        break;
      case AppLogType.navigation:
        writer.writeByte(5);
        break;
      case AppLogType.network:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLogTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
