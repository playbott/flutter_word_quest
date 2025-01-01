import 'dart:math';

import 'package:cword/core/helpers/list.dart';
import 'package:cword/data/model/base_crossword.dart';
import 'package:cword/data/model/position.dart';

class Crossword implements BaseCrossword {

  dynamic removeCell(int x, int y) {
    return _board[x][y] = ' ';
  }

  dynamic trimMatrix() {
    if (_board.isEmpty) return;

    List<List<String>> newMatrix = _board.deepCopy();
    bool isRowEmpty(List<String> row) {
      return row.every((element) => !RegExp(r'[a-zA-Z]').hasMatch(element));
    }

    if (isRowEmpty(newMatrix[0])) {
      _boardRowCount--;
      newMatrix.removeAt(0);
    }

    if (isRowEmpty(newMatrix[newMatrix.length - 1])) {
      _boardRowCount--;
      newMatrix.removeAt(newMatrix.length - 1);
    }

    // Удаляем пустые столбцы слева
    while (newMatrix.isNotEmpty &&
        newMatrix.every((row) =>
            row.isNotEmpty && !RegExp(r'[a-zA-Z]').hasMatch(row.first))) {
      for (var row in newMatrix) {
        if (row.isNotEmpty) {
          row.removeAt(0);
        }
      }
      _boardColumnCount--;
    }

    // Удаляем пустые столбцы справа
    while (newMatrix.isNotEmpty &&
        newMatrix.every((row) =>
            row.isNotEmpty && !RegExp(r'[a-zA-Z]').hasMatch(row.last))) {
      for (var row in newMatrix) {
        if (row.isNotEmpty) {
          row.removeLast();
        }
      }
      _boardColumnCount--;
    }

    _board = newMatrix;
  }

// Список стартовых позиций слов.
  late final List<Position> _starts = [];

// Счётчик вставленных блоков.
  int _nBlockInserted = 0;

// Количество строк в доске.
  late int _boardRowCount;

  // Количество столбцов в доске.
  late int _boardColumnCount;

  // Счётчики для количества слов по горизонтали и вертикали.
  late int _hCount, _vCount;

  // Генератор случайных чисел.
  static late Random _rand;

  // Список слов для вставки в кроссворд.
  static List<String> _wordsToInsert = [];

  // Временная доска для хранения состояния.
  static List<List<String>> _tempBoard = [];

  // Лучшее решение для минимизации пустых клеток.
  static int _bestSol = 0;

// Направления для поиска слов (по горизонтали и по вертикали).
  final List<int> _dirX = [0, 1];

// Направления для поиска слов (по горизонтали и по вертикали).
  final List<int> _dirY = [1, 0];

  // Доска кроссворда.
  List<List<String>> _board = [];

  // Матрица для хранения информации о горизонтальных словах.
  List<List<int>> _hWords = [];

// Матрица для хранения информации о вертикальных словах.
  List<List<int>> _vWords = [];

  // Множество допустимых символов для кроссворда.
  @override
  String allowedSymbols = "abcdefghijklmnopqrstuvwxyz";

  // Список использованных слов.
  @override
  List<String> usedWords = [];

  // Время начала генерации.
  @override
  late DateTime initialTime;

  Crossword(int xDimen, int yDimen) {
    // Инициализация размеров доски.
    _boardRowCount = xDimen;
    _boardColumnCount = yDimen;

    // Создание нового генератора случайных чисел.
    _rand = Random();

    // Заполнение доски пустыми символами.
    _board = List.generate(xDimen, (_) => List.filled(yDimen, ' '));

    // Заполнение матрицы для горизонтальных слов.
    _hWords = List.generate(xDimen, (_) => List.filled(yDimen, 0));

    // Заполнение матрицы для вертикальных слов.
    _vWords = List.generate(xDimen, (_) => List.filled(yDimen, 0));

    // Установка времени начала.
    initialTime = DateTime.now();
  }

  // Отображение доски с пробелами для пустых клеток.
  @override
  String toString() {
    String result = "";
    for (int i = 0; i < _boardRowCount; i++) {
      for (int j = 0; j < _boardColumnCount; j++) {
        result += allowedSymbols.contains(_board[i][j].toString())
            ? _board[i][j]
            : ' ';
      }
      if (i < _boardRowCount - 1) result += '\n';
    }
    return result;
  }

  // Метод для сброса доски.
  @override
  void reset() {
    for (var i = 0; i < _boardRowCount; i++) {
      for (var j = 0; j < _boardColumnCount; j++) {
        // Очищаем доску.
        _board[i][j] = ' ';
        _vWords[i][j] = 0;
        _hWords[i][j] = 0;

        // Сброс счётчиков слов.
        _hCount = _vCount = 0;
      }
    }
  }

  // Получение символа на позиции (r, c).
  @override
  String getAt(int r, int c) {
    return _board[r][c];
  }

  // Установка значения на позицию (r, c).
  @override
  void setAt(int r, int c, String value) {
    _board[r][c] = value;
  }

  // Получение количества строк доски.
  @override
  int get boardRowCount {
    return _boardRowCount;
  }

  // Получение количества столбцов доски.
  @override
  int get boardColumnCount {
    return _boardColumnCount;
  }

  // Проверка валидности позиции на доске.
  @override
  bool isValidPosition(int x, int y) {
    return x >= 0 && y >= 0 && x < _boardRowCount && y < _boardColumnCount;
  }

  // Проверка, можно ли разместить слово на доске в данной позиции и направлении.
  @override
  int canBePlaced(String word, int x, int y, int dir) {
    var result = 0;

    if (dir == 0) {
      // Горизонтальное размещение.
      for (var j = 0; j < word.length; j++) {
        int x1 = x, y1 = y + j;

        if (!(isValidPosition(x1, y1) &&
            (_board[x1][y1] == ' ' || _board[x1][y1] == word[j]))) {
          return -1;
        }
        if (isValidPosition(x1 - 1, y1)) if (_hWords[x1 - 1][y1] > 0) return -1;
        if (isValidPosition(x1 + 1, y1)) if (_hWords[x1 + 1][y1] > 0) return -1;
        if (_board[x1][y1] == word[j]) result++;
      }
    } else {
      // Вертикальное размещение.
      for (var j = 0; j < word.length; j++) {
        int x1 = x + j, y1 = y;
        if (!(isValidPosition(x1, y1) &&
            (_board[x1][y1] == ' ' || _board[x1][y1] == word[j]))) {
          return -1;
        }
        if (isValidPosition(x1, y1 - 1)) if (_vWords[x1][y1 - 1] > 0) return -1;
        if (isValidPosition(x1, y1 + 1)) if (_vWords[x1][y1 + 1] > 0) return -1;
        if (_board[x1][y1] == word[j]) result++;
      }
    }

    // Проверка, можно ли разместить слово в соседних клетках.
    int xStar = x - _dirX[dir], yStar = y - _dirY[dir];
    if (isValidPosition(xStar, yStar)) {
      if (!(_board[xStar][yStar] == ' ' || _board[xStar][yStar] == '*')) {
        return -1;
      }
    }

    xStar = x + _dirX[dir] * word.length;
    yStar = y + _dirY[dir] * word.length;
    if (isValidPosition(xStar, yStar)) {
      if (!(_board[xStar][yStar] == ' ' || _board[xStar][yStar] == '*')) {
        return -1;
      }
    }

    return result == word.length ? -1 : result;
  }

  // Вставка слова на доску.
  @override
  void putWord(String word, int x, int y, int dir, int value) {
    if (usedWords.contains(word)) {
      // Если слово уже использовано, не вставлять его.
      return;
    }
    var mat = dir == 0 ? _hWords : _vWords;

    // Добавление слова в список использованных.
    usedWords.add(word);

    // Увеличение счётчика вставленных блоков.
    _nBlockInserted++;

    // Сохранение стартовой позиции.
    _starts.add(Position(x: x, y: y, direction: dir));

    // Вставка символов слова на доску.
    for (var i = 0; i < word.length; i++) {
      int x1 = x + _dirX[dir] * i, y1 = y + _dirY[dir] * i;
      _board[x1][y1] = word[i];
      mat[x1][y1] = value;
    }

    // Установка символов '*' для обозначения границ слова.
    int xStar = x - _dirX[dir], yStar = y - _dirY[dir];
    if (isValidPosition(xStar, yStar)) _board[xStar][yStar] = '*';
    xStar = x + _dirX[dir] * word.length;
    yStar = y + _dirY[dir] * word.length;
    if (isValidPosition(xStar, yStar)) _board[xStar][yStar] = '*';
  }

  // Попытка вставить слово в кроссворд.
  @override
  int addWord(String word) {
    var wordToInsert = word;

    // Получение лучшей позиции для слова.
    var info = bestPosition(wordToInsert);
    if (info != null) {
      if (info.direction == 0) {
        _hCount++;
      } else {
        _vCount++;
      }
      var value = info.direction == 0 ? _hCount : _vCount;
      putWord(wordToInsert, info.x, info.y, info.direction,
          value); // Вставка слова.
      return info.direction;
    }

    // Если не удалось найти подходящую позицию.
    return -1;
  }

  // Поиск всех возможных позиций для размещения слова.
  @override
  List<Position> findPositions(String word) {
    var max = 0;
    List<Position> positions = [];
    for (var x = 0; x < _boardRowCount; x++) {
      for (var y = 0; y < _boardColumnCount; y++) {
        for (var i = 0; i < _dirX.length; i++) {
          var dir = i;
          var wordToInsert = word;

          // Проверка, можно ли поставить слово на данной позиции.
          var count = canBePlaced(wordToInsert, x, y, dir);

          if (count < max) continue;
          if (count > max) positions.clear();

          max = count;
          positions.add(Position(x: x, y: y, direction: dir));
        }
      }
    }

    // Возвращение всех подходящих позиций.
    return positions;
  }

  // Выбор лучшей позиции для слова.
  @override
  Position? bestPosition(String word) {
    // Поиск всех позиций.
    var positions = findPositions(word);
    if (positions.isNotEmpty) {
      // Выбор случайной позиции.
      var index = _rand.nextInt(positions.length);
      return positions[index];
    }

    // Если подходящих позиций нет.
    return null;
  }

  // Получение доски.
  @override
  List<List<String>> getBoard() {
    return _board;
  }

  // Добавление множества слов в кроссворд.
  @override
  void addWords(List<String> words) {
    _wordsToInsert = words;
    _bestSol = boardRowCount * boardColumnCount;
    initialTime = DateTime.now();

    // Генерация кроссворда.
    generate(0);

    // Применение полученной доски.
    _board = _tempBoard;
  }

  // Подсчёт количества пустых клеток.
  @override
  int freeSpaces() {
    var count = 0;
    for (var i = 0; i < boardRowCount; i++) {
      for (var j = 0; j < boardColumnCount; j++) {
        if (_board[i][j] == ' ' || _board[i][j] == '*') count++;
      }
    }
    return count;
  }

  // Рекурсивная генерация кроссворда.
  @override
  void generate(int pos) {
    if (pos >= _wordsToInsert.length ||
        (DateTime.now().difference(initialTime)).inMinutes > 1) {
      return;
    }

    for (int i = pos; i < _wordsToInsert.length; i++) {
      var posi = bestPosition(_wordsToInsert[i]);
      if (posi != null) {
        var word = _wordsToInsert[i];

        var value = posi.direction == 0 ? _hCount : _vCount;

        // Вставка слова.
        putWord(word, posi.x, posi.y, posi.direction, value);

        // Рекурсивный вызов для следующего слова.
        generate(pos + 1);

        // Удаление слова для следующей попытки.
        removeWord(word, posi.x, posi.y, posi.direction);
      } else {
        // Если позиция не найдена, пробуем следующее слово.
        generate(pos + 1);
      }
    }

    var c = freeSpaces();
    if (c >= _bestSol) {
      // Если пустых клеток больше, чем в лучшем решении, выходим.
      return;
    }
    _bestSol = c;

    // Сохраняем текущее состояние доски.
    _tempBoard = List<List<String>>.from(_board);
  }

  // Удаление слова с доски.
  @override
  void removeWord(String word, int x, int y, int dir) {
    var mat = dir == 0 ? _hWords : _vWords;
    var mat1 = dir == 0 ? _vWords : _hWords;

    for (var i = 0; i < word.length; i++) {
      int x1 = x + _dirX[dir] * i, y1 = y + _dirY[dir] * i;
      // Удаляем слово.
      if (mat1[x1][y1] == 0) _board[x1][y1] = ' ';
      mat[x1][y1] = 0;
    }

    // Убираем символы '*' для обозначения границ.
    int xStar = x - _dirX[dir], yStar = y - _dirY[dir];
    if (isValidPosition(xStar, yStar) && hasFactibleValueAround(xStar, yStar)) {
      _board[xStar][yStar] = ' ';
    }

    xStar = x + _dirX[dir] * word.length;
    yStar = y + _dirY[dir] * word.length;
    if (isValidPosition(xStar, yStar) && hasFactibleValueAround(xStar, yStar)) {
      _board[xStar][yStar] = ' ';
    }
  }

  // Проверка, есть ли подходящие значения вокруг клетки.
  @override
  bool hasFactibleValueAround(int x, int y) {
    for (var i = 0; i < _dirX.length; i++) {
      int x1 = x + _dirX[i], y1 = y + _dirY[i];
      if (isValidPosition(x1, y1) &&
          (_board[x1][y1] != ' ' || _board[x1][y1] == '')) {
        return true;
      }
      x1 = x - _dirX[i];
      y1 = y - _dirY[i];
      if (isValidPosition(x1, y1) &&
          (_board[x1][y1] != ' ' || _board[x1][y1] == '')) {
        return true;
      }
    }
    return false;
  }

  // Проверка, завершён ли кроссворд.
  @override
  bool isCompleted() {
    return (boardRowCount * boardColumnCount) - _nBlockInserted < 1;
  }

  // Получение стартовых позиций.
  @override
  List<Position> getStarts() {
    return _starts;
  }
}
