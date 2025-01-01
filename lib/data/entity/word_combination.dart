class WordCombinationSave {
  int id;
  String comb;
  int wordsCount;
  int levelId;

  WordCombinationSave({
    required this.id,
    required this.comb,
    required this.wordsCount,
    required this.levelId,
  });

  WordCombinationSave.fromMap(Map<String, dynamic> map)
      : this(
          id: map['id'],
          comb: map['comb'],
          wordsCount: map['words_count'],
          levelId: map['level_id'],
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'comb': comb,
      'words_count': wordsCount,
      'level_id': levelId,
    };
  }
}