import 'dart:convert';

class LevelSave {
  LevelSave({
    required this.wordsGrid,
    required this.words,
    required this.gridSizeX,
    required this.gridSizeY,
    required this.letters,
    this.isConfirmed = false,
    this.number = 0,
    this.lettersCount = 0,
    this.wordsCount = 0,
  });

  final List<List<String>> wordsGrid;
  final int gridSizeX;
  final int gridSizeY;
  final bool isConfirmed;
  final int number;
  final String letters;
  final int lettersCount;
  final int wordsCount;
  final List<String> words;

  Map<String, dynamic> toMap() {
    final map = {
      'words': jsonEncode(wordsGrid),
      'grid_size': '$gridSizeX, $gridSizeY',
      'letters': letters,
      'is_confirmed': isConfirmed ? 1 : 0,
      'number': number,
      'letters_count': letters.length,
      'words_count': words.length,
    };

    return map;
  }

  factory LevelSave.fromMap(Map<String, dynamic> map) {
    return LevelSave(
      wordsGrid: jsonDecode(map['words'] as String),
      gridSizeX: int.parse(map['grid_size'].split(',')[0]),
      gridSizeY: int.parse(map['grid_size'].split(',')[1]),
      isConfirmed: map['is_confirmed'],
      number: map['number'],
      letters: map['letters'],
      lettersCount: map['letters_count'],
      wordsCount: map['words_count'],
      words: [],
    );
  }
}
