/*
import 'package:cword/model/crossword.dart';
import 'package:cword/model/position.dart';
import 'package:cword/ui/word_square.dart';
import 'package:flutter/material.dart';

class CrossWordBuilder {
  static List<Widget> buildRowsInSquare(
      BuildContext context, Crossword c) {
    var row = <Widget>[];

    const int percBorder = 10;
    const int topBorder = 100;
    const int percSquareBorder = 5;

    final int rows = c.boardRowCount;
    final int coloumns = c.boardColumnCount;

    double width = MediaQuery.of(context).size.width;
    double border = width * percBorder / 100.0;

    double lato = (width - (border * 2)) / rows;
    double latoBordo = lato * percSquareBorder / 100.0;

    var board = c.getBoard();

    int horizontaStarts = 0, verticalStarts = 0;

    List<Position> starts = c.getStarts();

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < coloumns; j++) {
        int pos = _contains(starts, i, j);

        horizontaStarts = pos == 0 ? horizontaStarts + 1 : horizontaStarts;
        verticalStarts = pos == 1 ? verticalStarts + 1 : verticalStarts;

        bool isCellEmpty = board[i][j] == ' ' || board[i][j] == '*';

        row.add(WordSquare(
          left: ((lato * i) + border),
          top: ((lato * j) + topBorder),
          lato: lato - latoBordo,
          bgColor: isCellEmpty ? Colors.transparent : Colors.pink,
          textColor: isCellEmpty ? Colors.transparent : Colors.white,
          symbol: isCellEmpty ? '' : board[i][j],
          onClick: () {
            if (pos != -1) {
              print(pos);
            }
          },
        ));
      }
    }

    return row;
  }

  static int _contains(List<Position> list, int x, int y) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].x == x && list[i].y == y) {
        return i;
      }
    }
    return -1;
  }
}


class WordSquare extends StatelessWidget {
  const WordSquare({
    super.key,
    required this.symbol,
    required this.left,
    required this.top,
    required this.lato,
    required this.bgColor,
    required this.textColor,
    required this.onClick,
  });

  final double left;
  final double top;
  final double lato;
  final Color bgColor;
  final Color textColor;
  final String symbol;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        width: lato,
        height: lato,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: GestureDetector(
                onTap: onClick,
                child: Container(
                  color: bgColor,
                  child: Stack(children: <Widget>[
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          symbol.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                    )
                  ]),
                ))));
  }
}
*/
