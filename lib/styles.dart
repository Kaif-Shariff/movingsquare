import 'package:flutter/material.dart';

final btnStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(Colors.grey),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  overlayColor: WidgetStateProperty.all(Colors.transparent),
);

final txtStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
