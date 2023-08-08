import 'package:flutter/material.dart';

class HomePageTopSection extends StatelessWidget {
  const HomePageTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 19, top: 19),
              child: Text(
                'Hi Dev Test ',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
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
