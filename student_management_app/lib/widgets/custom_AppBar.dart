// ignore: file_names
import 'package:flutter/material.dart';

AppBar customAppbar({required String appbarTitle, List<Widget>? acions}) {
  return AppBar(
    title: Text(appbarTitle),
    elevation: 0,
    actions: acions,
    backgroundColor: const Color.fromARGB(255, 10, 150, 163),
  );
}
