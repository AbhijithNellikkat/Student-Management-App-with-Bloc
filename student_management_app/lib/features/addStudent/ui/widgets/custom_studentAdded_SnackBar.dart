import 'package:flutter/material.dart';

SnackBar studentAddedSnackBar() {
  return const SnackBar(
    content: Text('Student Details Added successfully'),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(12),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 2),
  );
}
