import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Not Found',style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
      ),
    );
  }
}