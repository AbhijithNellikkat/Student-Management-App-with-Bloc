import 'package:flutter/material.dart';

import '../utils/helperFunctions/google_signin_function.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => signInWithGoogle(),
          child: const Text('Sign With Google'),
        ),
      ),
    );
  }
}
