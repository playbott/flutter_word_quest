class Word {
  Word({required this.word, required this.length});

  final String word;
  final int length;

  @override
  String toString() {
    return 'Word: $word, length: $length';
  }

  static List<Word> fromListMap(List<Map<String, Object?>> list) {
    return list.map((e) => Word.fromMap(e)).toList();
  }

  factory Word.fromMap(Map<String, Object?>  map) {
    return Word(
      word: map['word'] as String,
      length: map['len'] as int,
    );
  }
}

