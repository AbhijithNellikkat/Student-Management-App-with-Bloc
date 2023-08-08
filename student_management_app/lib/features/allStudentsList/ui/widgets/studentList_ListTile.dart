import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StudentListTileWidget extends StatelessWidget {
  StudentListTileWidget({
    super.key,
    required this.image,
    required this.fullName,
    required this.idNumber,
  });

  // ignore: prefer_typing_uninitialized_variables
  var image;
  final String fullName;
  final int idNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white60,
      leading: image != null
          ? CircleAvatar(
              radius: 30,
              backgroundImage: MemoryImage(image),
            )
          : const CircleAvatar(
              child: Icon(Icons.person),
            ),
      title: Text('Name : $fullName ',
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('idNumber : $idNumber ',
          style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: const Icon(
        Icons.keyboard_double_arrow_left_outlined,
        color: Colors.black,
      ),
    );
  }
}
