import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CenterLottieSection extends StatelessWidget {
  const CenterLottieSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: MediaQuery.of(context).size.height * 0.39,
        child: Lottie.network(
            'https://lottie.host/cdf6dd16-1c5b-4495-a62e-70cdc3f576c4/4Op0NCqmuf.json'),
      ),
    );
  }
}
