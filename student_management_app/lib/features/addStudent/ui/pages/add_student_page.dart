import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/features/addStudent/bloc/add_student_bloc.dart';
import 'package:student_management_app/features/addStudent/ui/widgets/custom_studentAdded_SnackBar.dart';
import 'package:student_management_app/widgets/custom_AppBar.dart';

import '../widgets/custom_StudentsAddForm.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});

  final AddStudentBloc addStudentBloc = AddStudentBloc();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddStudentBloc, AddStudentState>(
      bloc: addStudentBloc,
      listenWhen: (previous, current) => current is AddStudentSuccessSate,
      buildWhen: (previous, current) => current is! AddStudentSuccessSate,
      listener: (context, state) {
        if (state is AddStudentSuccessSate) {
          ScaffoldMessenger.of(context).showSnackBar(studentAddedSnackBar());
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppbar(appbarTitle: 'Add Student'),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: CustomAddStudentForm(
                    bloc: addStudentBloc,
                    fullNameController: fullNameController,
                    idNumberController: idNumberController,
                  )),
            ),
          ),
        );
      },
    );
  }
}
