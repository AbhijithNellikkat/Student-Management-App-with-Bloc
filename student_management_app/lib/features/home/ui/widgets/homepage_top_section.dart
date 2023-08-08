import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageTopSection extends StatelessWidget {
  HomePageTopSection({
    super.key,
  });
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19, top: 19),
              child: Text(
                'Hi , ${user.displayName}',
                style:
                    const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                ' Today is a good \n day to learn \n something new !',
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
