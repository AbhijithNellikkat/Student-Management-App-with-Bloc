import 'package:flutter/material.dart';

import '../../bloc/home_bloc.dart';

class bottonCardSection extends StatelessWidget {
  const bottonCardSection({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              bloc.add(HomeAddStudentCardNavigateEvent());
            },
            child: const Card(
              elevation: 7,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 30.0, right: 40.0, bottom: 60, top: 60.0),
                child: Center(child: Text('Add Student')),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              bloc.add(HomeAllStudentsListCardNavigateEvent());
            },
            child: const Card(
              elevation: 7,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 30.0, right: 20.0, bottom: 66, top: 60.0),
                child: Text('All Students List'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
