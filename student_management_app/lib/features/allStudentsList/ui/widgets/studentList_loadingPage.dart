import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StudentListLoadingPage extends StatelessWidget {
  const StudentListLoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://lottie.host/a9293654-5ebf-4ca0-a874-ac430c0e6ed5/iR9DwmlMQE.json'),
      ),
    );
  }
}
