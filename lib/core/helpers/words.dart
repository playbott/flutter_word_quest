import 'dart:collection';

import 'package:cword/data/datasources/locale/sqlite_source.dart';
import 'package:cword/data/model/language.dart';

List<String> generateLetterCombinations(int minLength, int maxLength) {
  const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final results = <String>[];

  void combine(String prefix, int start) {
    if (prefix.length >= minLength && prefix.length <= maxLength) {
      results.add(prefix);
    }
    if (prefix.length < maxLength) {
      for (var i = start; i < letters.length; i++) {
        combine(prefix + letters[i], i + 1);
      }
    }
  }

  combine('', 0);
  return results;
}

dynamic saveLetterCombinationsToDbEng({
  required List<String> data,
  required Language language,
}) async {
  final dbSource = SQLiteSource.instance;
  try {
    final db = await dbSource.database;
    await db.transaction(
      (txn) async {
        for (var combination in data) {
          await txn.insert('letter_${language.name}_combinations', {
            'comb': combination,
          });
        }
      },
    );
  } catch (e) {
    print(e);
  }
  return null;
}

List<String> generateLetterCombinations2(int minLen, int maxLen) {
  const String alphabet = 'abcdefghijklmnopqrstuvwxyz';
  List<String> letters = alphabet.split('');

  List<String> result = [];

  void combine(String current, List<String> remaining, int length) {
    if (current.length == length) {
      result.add(current);
      return;
    }

    for (int i = 0; i < remaining.length; i++) {
      combine(current + remaining[i], remaining.sublist(i + 1), length);
    }
  }

  for (int length = minLen; length <= maxLen; length++) {
    combine('', letters, length);
  }

  return removeDuplicates(result);
}

List<String> removeDuplicates(List<String> combinations) {
  HashSet<String> uniqueSet = HashSet();
  for (var combination in combinations) {
    String sorted = String.fromCharCodes(combination.runes.toList()..sort());
    uniqueSet.add(sorted);
  }
  return uniqueSet.toList();
}

List<String> removeDuplicatedLetters(List<String> words) {
  List<String> newWords = List<String>.from(words);
  newWords.removeWhere(
      (word) => newWords.length == 3 && word.split('').toSet().length < 3);
  return newWords;
}
