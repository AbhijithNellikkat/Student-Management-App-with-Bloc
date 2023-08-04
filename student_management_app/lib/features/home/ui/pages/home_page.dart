import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/features/addStudent/ui/pages/add_student_page.dart';
import 'package:student_management_app/features/allStudentsList/ui/pages/all_students_list_page.dart';
import 'package:student_management_app/features/home/bloc/home_bloc.dart';
import 'package:student_management_app/widgets/custom_AppBar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeBloc homeBloc = HomeBloc();

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
          drawer: const Drawer(),
          appBar: customAppbar(appbarTitle: 'Student App'),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    homeBloc.add(HomeAddStudentCardNavigateEvent());
                  },
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text('Add Student'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeBloc.add(HomeAllStudentsListCardNavigateEvent());
                  },
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text('All Students List'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
