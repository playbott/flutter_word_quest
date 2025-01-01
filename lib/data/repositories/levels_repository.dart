import 'dart:convert';

import 'package:cword/data/datasources/locale/sqlite_source.dart';
import 'package:cword/data/entity/level_save.dart';
import 'package:cword/data/model/language.dart';

class LevelSaveRepository {
  final dbSource = SQLiteSource.instance;

  Future<int?> insertLetterCombination({
    required LevelSave level,
    required Language language,
  }) async {
    int? id;

    try {
      final db = await dbSource.database;
      await db.transaction(
        (txn) async {
          id = await txn.rawInsert('''
          insert into levels_${language.name} 
          (grid, is_confirmed, letters, grid_size, words)
          values ('${jsonEncode(level.wordsGrid)}', 0, '${level.letters}', '${level.gridSizeX}, ${level.gridSizeY}', '${level.words.join(',')}')
          ''');
          for (var word in level.words) {
            await txn.insert('levels_${language.name}_used_words',
                {'level_id': id, 'word': word});
          }
        },
      );
    } catch (e) {
      print(e);
    }

    print('Level $id added');

    return id;
  }

  Future<int?> insertLevel({
    required LevelSave level,
    required Language language,
  }) async {
    int? id;

    try {
      final db = await dbSource.database;
      await db.transaction(
        (txn) async {
          id = await txn.rawInsert('''
          insert into levels_${language.name} 
          (grid, is_confirmed, letters, grid_size, words)
          values ('${jsonEncode(level.wordsGrid)}', 0, '${level.letters}', '${level.gridSizeX}, ${level.gridSizeY}', '${level.words.join(',')}')
          ''');
          for (var word in level.words) {
            await txn.insert('levels_${language.name}_used_words',
                {'level_id': id, 'word': word});
          }
        },
      );
    } catch (e) {
      print(e);
    }

    print('Level $id added');

    return id;
  }

  Future<List<LevelSave>> getLevels() async {
    final db = await dbSource.database;
    final maps = await db.query('levels');

    return maps.map((map) => LevelSave.fromMap(map)).toList();
  }

  Future<int> updateLevelConfirmation(int id, bool isConfirmed) async {
    final db = await dbSource.database;
    return await db.update(
      'levels',
      {'isConfirmed': isConfirmed ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
