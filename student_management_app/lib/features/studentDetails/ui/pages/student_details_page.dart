import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/widgets/custom_AppBar.dart';

import '../../bloc/student_details_bloc.dart';

class StudentDetailsPage extends StatefulWidget {
  final int index;
  const StudentDetailsPage({
    required this.index,
    super.key,
  });

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  StudentDetailsBloc studentDetailsBloc = StudentDetailsBloc();

  @override
  void initState() {
    studentDetailsBloc.add(StudentDetailsInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentDetailsBloc, StudentDetailsState>(
      bloc: studentDetailsBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is StudentDetailsLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is StudentDetailsLoadedSuccessState) {
          return Scaffold(
            appBar: customAppbar(appbarTitle: ''),
            body: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/premium-vector/social-media-network-people-connected-digital-interactive-communicate-global-concept_24877-67182.jpg'),
                fit: BoxFit.cover,
              )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: SizedBox(
                    width: 300,
                    height: 500,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(48.0),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: MemoryImage(state
                                .students[widget.index]['studentProfileImage']),
                          ),
                        ),
                        Text(
                          'Name : ${state.students[widget.index]['fullName']}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 0),
                        Text(
                          'ID Number : ${state.students[widget.index]['idNumber']}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("error"),
            ),
          );
        }
      },
    );
  }
}
