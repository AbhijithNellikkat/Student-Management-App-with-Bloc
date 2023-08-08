  import 'package:flutter/material.dart';

SnackBar imageSelectedSnackBar() {
    return const SnackBar(
      content: Text('Image Selected from gallery'),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(12),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    );
  }
