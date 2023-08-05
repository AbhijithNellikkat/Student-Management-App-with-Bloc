import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_app/features/addStudent/bloc/add_student_bloc.dart';
import 'package:student_management_app/widgets/custom_AppBar.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});

  final AddStudentBloc addStudentBloc = AddStudentBloc();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController classController = TextEditingController();
  // final TextEditingController addressController = TextEditingController();
  // final TextEditingController dateofBirthController = TextEditingController();
  // final TextEditingController bloodGroupController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var image;
  late Uint8List imageByts;
  // ignore: prefer_typing_uninitialized_variables
  var compressedImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddStudentBloc, AddStudentState>(
      bloc: addStudentBloc,
      listenWhen: (previous, current) => current is AddStudentSuccessSate,
      buildWhen: (previous, current) => current is! AddStudentSuccessSate,
      listener: (context, state) {
        if (state is AddStudentSuccessSate) {
          Navigator.pop(context);
        } else if (state is AddStudentErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Student Data Added'),
            duration: Duration(seconds: 2),
          ));
        }
      },
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
                      onPressed: () async {
                        image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        imageByts = await image!.readAsBytes();
                        compressedImage =
                            await FlutterImageCompress.compressWithList(
                                imageByts,
                                quality: 84);
                      },
                      child: const Icon(Icons.photo_sharp),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addStudentBloc.add(AddStudentSaveButtonEvent(
                            studentProfileImage: compressedImage,
                            fullname: fullNameController.text,
                            idNumber: int.parse(idNumberController.text)));
                        print('AddStudentSaveButtonEvent => called');
                        // Navigator.pop(context);
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
