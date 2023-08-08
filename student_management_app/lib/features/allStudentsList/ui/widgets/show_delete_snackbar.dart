import 'package:flutter/material.dart';

SnackBar showDeleteSnackBar() {
  return const SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(20),
    backgroundColor: Colors.red,
    elevation: 10,
    content: Text('Student data Deleted !!!'),
    duration: Duration(seconds: 2),
  );
}
