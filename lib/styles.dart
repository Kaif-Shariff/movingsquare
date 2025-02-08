import 'package:flutter/material.dart';

/// Button style used for the left and right movement buttons.
final ButtonStyle btnStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(Colors.grey),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  overlayColor: WidgetStateProperty.all(Colors.transparent),
);

/// Text style used for the button labels.
const TextStyle txtStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);