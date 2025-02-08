import 'package:flutter/material.dart';
import 'package:movingsquare/styles.dart';

/// A stateful widget that animates a square movement left and right.
///
/// The square starts in the center and can move fully to the left or right
/// when the respective button is clicked. The buttons disable when movement
/// is in progress or when the square reaches the edge.
class SquareAnimation extends StatefulWidget {
  /// Creates an instance of `SquareAnimation`.
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() => SquareAnimationState();
}

/// Manages the state of `SquareAnimation`, handling movement and button states.
class SquareAnimationState extends State<SquareAnimation> {
  /// The fixed size of the square.
  static const double _squareSize = 150.0;

  /// The current left position of the square.
  double _leftPosition = 0.0;

  /// Indicates if the square is currently moving.
  bool _moving = false;

  /// Indicates if the square can move right.
  bool _canMoveRight = true;

  /// Indicates if the square can move left.
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

  /// Moves the square to a new position with animation.
  ///
  /// Disables both buttons while the square is moving.
  /// Re-enables buttons when movement is complete based on position.
  void _moveSquare(double newPosition) {
    setState(() {
      _moving = true;
      _canMoveRight = false;
      _canMoveLeft = false;
    });

    Future.delayed(const Duration(seconds: 1), () {
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
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: _leftPosition,
                  duration: const Duration(seconds: 1),
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
                  onPressed: _canMoveLeft && !_moving ? () => _moveSquare(0) : null,
                  style: btnStyle,
                  child: const Text(
                    'Right',
                    style: txtStyle,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _canMoveRight && !_moving ? () => _moveSquare(screenWidth - _squareSize) : null,
                  style: btnStyle,
                  child: const Text(
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
