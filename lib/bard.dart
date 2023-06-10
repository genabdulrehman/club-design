import 'dart:math';

import 'package:flutter/material.dart';

class Bard extends StatefulWidget {
  const Bard({Key? key});

  @override
  State<Bard> createState() => _BardState();
}

Color _color = Colors.black;

class _BardState extends State<Bard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _color = Colors.red;
              });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            ),
          ),
          _color == Colors.black
              ? Center(
                  child: DrawingBoard(
                    color: Colors.black,
                  ),
                )
              : Center(
                  child: DrawingBoard(
                    color: Colors.red,
                  ),
                )
        ],
      ),
    );
  }
}

class DrawingBoard extends StatefulWidget {
  final Color color;
  const DrawingBoard({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  List<Offset?> _points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          print("update");
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          Offset localPosition =
              renderBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(
        painter: _DrawingPainter(_points, widget.color),
        size: Size.fromHeight(500),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  List<Offset?> points;
  Color color;

  _DrawingPainter(
    this.points,
    this.color,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DrawingPainter oldDelegate) => true;
}
