import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/features/addStudent/ui/pages/add_student_page.dart';
import 'package:student_management_app/features/allStudentsList/ui/pages/all_students_list_page.dart';
import 'package:student_management_app/features/home/bloc/home_bloc.dart';
import 'package:student_management_app/features/home/ui/widgets/homepage_drawer.dart';

import '../widgets/homepage_appBar.dart';
import '../widgets/homepage_body.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeBloc homeBloc = HomeBloc();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToAddStudentPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudentPage(),
            ),
          );
        } else if (state is HomeNavigateToAllStudentsListPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AllStudentsListPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer: CustomDrawerWidget(user: user),
          appBar: homePageAppBar(),
          body: HomePageBody(bloc: homeBloc),
        );
      },
    );
  }
}
