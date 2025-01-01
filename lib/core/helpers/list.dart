List<List<String>> deepCopy(List<List<String>> original) {
  return original.map((row) => List<String>.from(row)).toList();
}

extension ListExtension<T> on List<T> {
  List<List<String>> deepCopy() {
    return map((row) => List<String>.from(row as List<String>)).toList();
  }

  List<String> removeDuplicatedLetters(int wordLength) {
    List<String> newWords = List<String>.from(this);
    newWords.removeWhere(
            (word) => newWords.length == wordLength && word.split('').toSet().length < wordLength);
    return newWords;
  }
}