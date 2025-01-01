import 'position.dart';

abstract class BaseCrossword {
  late String allowedSymbols;
  late List<String> usedWords;
  late DateTime initialTime;

  void reset();

  String getAt(int r, int c);

  void setAt(int r, int c, String value);

  int get boardRowCount;

  int get boardColumnCount;

  bool isValidPosition(int x, int y);

  int canBePlaced(String word, int x, int y, int dir);

  void putWord(String word, int x, int y, int dir, int value);

  int addWord(String word);

  List<Position> findPositions(String word);

  Position? bestPosition(String word);

  List<List<String>> getBoard();

  void addWords(List<String> words);

  int freeSpaces();

  void generate(int pos);

  void removeWord(String word, int x, int y, int dir);

  bool hasFactibleValueAround(int x, int y);

  bool isCompleted();

  List<Position> getStarts();
}
