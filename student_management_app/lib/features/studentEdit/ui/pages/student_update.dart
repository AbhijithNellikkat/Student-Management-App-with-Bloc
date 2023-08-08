import 'package:flutter/material.dart';

import '../../bloc/student_edit_bloc.dart';

class StudentUpdatePage extends StatefulWidget {
  final int index;
  StudentUpdatePage({super.key, required this.index});

  @override
  State<StudentUpdatePage> createState() => _StudentUpdatePageState();
}

class _StudentUpdatePageState extends State<StudentUpdatePage> {
  @override
  void initState() {
    super.initState();
  }

  final StudentEditBloc studeneStudentEditBloc = StudentEditBloc();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController idNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  label: Text('Name'),
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
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
