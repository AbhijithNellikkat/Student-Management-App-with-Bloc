import 'package:flutter/material.dart';

AppBar homePageAppBar() {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications,
          color: Colors.black,
        ),
      ),
      const CircleAvatar(
        backgroundColor: Colors.white30,
        backgroundImage: NetworkImage(
            'https://img.icons8.com/?size=512&id=82322&format=png'),
      ),
      const SizedBox(width: 19),
    ],
  );
}
