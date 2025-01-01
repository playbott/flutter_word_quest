import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_log_storage.g.dart';

class Storages {
  static const String playlists = 'devicePlaylists';
  static const String playlistPrefix = 'devicePlaylist-';
}

@HiveType(typeId: 0)
class AppLog {
  @HiveField(0)
  final DateTime timestamp;

  @HiveField(1)
  final String message;

  @HiveField(2)
  final AppLogType type;

  AppLog(this.timestamp, this.message, {this.type = AppLogType.info});
}

@HiveType(typeId: 2)
enum AppLogType {
  @HiveField(0)
  info,
  @HiveField(1)
  warning,
  @HiveField(2)
  error,
  @HiveField(3)
  wtf,
  @HiveField(4)
  tap,
  @HiveField(5)
  navigation,
  @HiveField(6)
  network,
}

/*
enum AppLogType {
  info(0),
  warning(1),
  error(2),
  wtf(3);

  final int code;

  static AppLogType byCode(int code) {
    AppLogType status = AppLogType.info;
    try {
      status =
          AppLogType.values.firstWhere((element) => (code == element.code));
    } catch (_) {
      return status;
    }
    return status;
  }

  const AppLogType(this.code);
}*/
/*
class DevicePlaylistHiveStore {
  final Box<Playlist> _playlistsBox;

  DevicePlaylistHiveStore(this._playlistsBox);

  Future<void> savePlaylist(Playlist playlist) async {
    await _playlistsBox.put(playlist.name.toString(), playlist);
  }

  Future<List<Playlist>> getAllPlaylists() async {
    return _playlistsBox.values.toList();
  }
}*/
