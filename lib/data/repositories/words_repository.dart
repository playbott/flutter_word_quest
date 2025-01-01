import 'package:cword/data/datasources/locale/sqlite_source.dart';
import 'package:cword/data/entity/level_save.dart';
import 'package:cword/data/model/language.dart';

class WordsRepository {
  final dbSource = SQLiteSource.instance;

  Future<List<Map<String, Object?>>> getAllWords(
      {required Language language}) async {
    final db = await dbSource.database;
    final result = await db.rawQuery('''
SELECT distinct ROW_NUMBER() OVER () AS row_num, word as word, length(word) as len
FROM common
where length(word) > 2;
      ''');
    return result;
  }

  Future<List<Map<String, Object?>>> searchByLetters(
      {required String letters, required Language lang}) async {
    final db = await dbSource.database;
    final result = await db.rawQuery('''
SELECT  distinct ROW_NUMBER() OVER () AS row_num, word as word, length(word) as len
FROM common
WHERE LENGTH(word) BETWEEN 2 AND 10
  AND NOT lower(word) GLOB lower('*[^$letters]*')
  AND word NOT IN (
                   'bitch',
                   'sex',
                   'cum',
                   'homo',
                   'ass',
                   'lie',
                   'eff',
                   'effed',
                   'anus',
                   'ed',
                   'eds',
                   'gang'
    )
  AND word NOT IN (select word from levels_${lang.name}_used_words)
    ;
      ''');
    return result;
  }
}
