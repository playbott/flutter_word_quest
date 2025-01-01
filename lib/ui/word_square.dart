import 'package:flutter/material.dart';

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
          ),
        ),
      ),
    );
  }
}
