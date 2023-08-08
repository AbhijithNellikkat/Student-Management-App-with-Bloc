import 'package:flutter/material.dart';

import '../../bloc/home_bloc.dart';
import 'homepage_bottonCard_section.dart';
import 'homepage_center_section.dart';
import 'homepage_top_section.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const HomePageTopSection(),
          const CenterLottieSection(),
          bottonCardSection(bloc: bloc)
        ],
      ),
    );
  }
}