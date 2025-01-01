import 'package:cword/data/entity/crossword.dart';
import 'package:flutter/material.dart';

class CrossWordGrid extends StatelessWidget {
  const CrossWordGrid({required this.crossword, super.key});

  final Crossword crossword;

  @override
  Widget build(BuildContext context) {
    final int rows = crossword.boardRowCount;
    final int columns = crossword.boardColumnCount;
    List<List<String>> board = crossword.getBoard();
    final startPositions = crossword.getStarts();
    print('\n $startPositions');
    print('\n${board.join('\n')}');
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        childAspectRatio: 1.0,
      ),
      // общее количество ячеек
      itemCount: rows * columns,
      itemBuilder: (context, index) {
        final int row = index ~/ columns;
        final int column = index % columns;
        final int startIndex = startPositions
            .indexWhere((element) => element.x == row && element.y == column);

        bool isCellEmpty =
            board[row][column] == ' ' || board[row][column] == '*';

        return GestureDetector(
          onTap: () {
            if (startIndex != -1) {
              print("Start index: $startIndex");
            }
          },
          child: Container(
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: isCellEmpty ? Colors.transparent : Colors.pink,
              gradient: LinearGradient(
                colors: [
                  Colors.pinkAccent.withAlpha(200),
                  Colors.pink,
                ],
                transform: GradientRotation(0.8),
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                isCellEmpty ? '' : board[row][column].toUpperCase(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: isCellEmpty ? Colors.transparent : Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
