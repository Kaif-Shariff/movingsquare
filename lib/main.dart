import 'package:flutter/material.dart';
import 'package:movingsquare/square_animation.dart';

/// The main entry point of the application.
///
/// Runs the `MyApp` widget, which initializes the application.
void main() {
  runApp(const MyApp());
}

/// A stateless widget that represents the root of the application.
///
/// It initializes the `MaterialApp` with `SquareAnimation` as its home.
class MyApp extends StatelessWidget {
  /// Creates an instance of `MyApp`.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SquareAnimation(),
    );
  }
}





