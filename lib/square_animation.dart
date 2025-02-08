import 'package:flutter/material.dart';
import 'package:movingsquare/styles.dart';

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  static const _squareSize = 150.0;
  double _leftPosition = 0.0;
  bool _moving = false;
  bool _canMoveRight = true;
  bool _canMoveLeft = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _leftPosition = (MediaQuery.of(context).size.width - _squareSize) / 2;
      });
    });
  }

  void _moveSquare(double newPosition) {
    setState(() {
      _moving = true;
      _canMoveRight = false;
      _canMoveLeft = false;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _leftPosition = newPosition;
        _moving = false;
        _canMoveRight = newPosition < MediaQuery.of(context).size.width - _squareSize;
        _canMoveLeft = newPosition > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: _leftPosition,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: _squareSize,
                    height: _squareSize,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(400, 0, 400, 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _canMoveLeft && !_moving
                      ? () {
                          _moveSquare(0);
                        }
                      : null,
                  style: btnStyle,
                  child: Text(
                    'Right',
                    style: txtStyle,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _canMoveRight && !_moving
                      ? () {
                          _moveSquare(screenWidth - _squareSize);
                        }
                      : null,
                  style: btnStyle,
                  child: Text(
                    'Left',
                    style: txtStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
