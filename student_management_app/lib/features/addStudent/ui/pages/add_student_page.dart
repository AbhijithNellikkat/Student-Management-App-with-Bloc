import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/features/addStudent/bloc/add_student_bloc.dart';
import 'package:student_management_app/widgets/custom_AppBar.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});

  final AddStudentBloc addStudentBloc = AddStudentBloc();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateofBirthController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddStudentBloc, AddStudentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: customAppbar(appbarTitle: 'Add Student'),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: fullNameController,
                      decoration: const InputDecoration(
                        label: Text('Full Name'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: idNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('ID Number'),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        addStudentBloc.add(AddStudentSaveButtonEvent(
                            fullname: fullNameController.text,
                            idNumber: int.parse(idNumberController.text)));
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 70),
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
