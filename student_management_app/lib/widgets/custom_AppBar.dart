// ignore: file_names
import 'package:flutter/material.dart';

AppBar customAppbar({String? appbarTitle, List<Widget>? acions}) {
  return AppBar(
    title: Text(appbarTitle!),
    elevation: 0,
    actions: acions,
  );
}
