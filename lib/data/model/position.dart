class Position {
  Position({
    required this.x,
    required this.y,
    required this.direction,
  });

  final int x;
  final int y;
  final int direction;

  @override
  String toString() {
    return 'Position{x: $x, y: $y, direction: $direction}\n';
  }
}
