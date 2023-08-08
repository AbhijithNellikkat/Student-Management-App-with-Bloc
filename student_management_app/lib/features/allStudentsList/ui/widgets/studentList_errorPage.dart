import 'package:flutter/material.dart';

import '../../../../widgets/custom_AppBar.dart';

class StudentListErrorPage extends StatelessWidget {
  const StudentListErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(appbarTitle: ''),
      body: const Center(
          child: Text(
        'Error ',
        style: TextStyle(
            color: Colors.red, fontSize: 33, fontWeight: FontWeight.bold),
      )),
    );
  }
}