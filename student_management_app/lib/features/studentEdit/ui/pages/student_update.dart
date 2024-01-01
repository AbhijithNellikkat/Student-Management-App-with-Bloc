import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/student_edit_bloc.dart';

class StudentUpdatePage extends StatefulWidget {
  final int index;
  var db;

  StudentUpdatePage({super.key, required this.index, required this.db});

  @override
  State<StudentUpdatePage> createState() => _StudentUpdatePageState();
}

class _StudentUpdatePageState extends State<StudentUpdatePage> {
  @override
  void initState() {
    super.initState();
  }

  // final StudentEditBloc studeneStudentEditBloc = StudentEditBloc();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController idNumberController = TextEditingController();

  final StudentEditBloc studentEditBloc = StudentEditBloc();
  @override
  Widget build(BuildContext context) {
    fullNameController.text = widget.db[widget.index]['fullName'];
    idNumberController.text = widget.db[widget.index]['idNumber'];
    return BlocConsumer<StudentEditBloc, StudentEditState>(
      bloc: studentEditBloc,
      listenWhen: (previous, current) => current is UpdateActionState,
      buildWhen: (previous, current) => current is! UpdateActionState,
      listener: (context, state) {
        if (state is UpdateState) {
          // studentEditBloc
        }
      },
      builder: (context, state) {
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
                    onPressed: () {
                      // studeneStudentEditBloc.add(
                      //     UpdateEvent(id: widget.db[widget.index]['id'], data: {
                      //   'fullName': fullNameController.text,
                      //   'idNumber': idNumberController.text,
                      // }));
                    },
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
      },
    );
  }
}
