import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_management_app/features/home/ui/pages/home_page.dart';
import 'package:student_management_app/widgets/frist_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something Went Wrong!!!"),
            );
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
