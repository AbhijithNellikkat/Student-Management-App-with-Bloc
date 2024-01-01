// ignore_for_file: file_names, use_build_context_synchronously
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_app/features/addStudent/ui/widgets/custom_TextFormField.dart';

import '../../bloc/add_student_bloc.dart';
import 'custom_imageSelected_SnackBar.dart';

// ignore: must_be_immutable
class CustomAddStudentForm extends StatelessWidget {
  CustomAddStudentForm({
    super.key,
    required this.fullNameController,
    required this.idNumberController,
    required this.bloc,
  });

  final TextEditingController fullNameController;
  final TextEditingController idNumberController;

  // ignore: prefer_typing_uninitialized_variables
  var myfile;
  late Uint8List imageByts;
  // ignore: prefer_typing_uninitialized_variables
  var compressedImage;
  // ignore: prefer_typing_uninitialized_variables
  var bloc;

  @override
  Widget build(BuildContext context) {
    imagePick() async {
      myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      imageByts = await myfile!.readAsBytes();
      compressedImage =
          await FlutterImageCompress.compressWithList(imageByts, quality: 85);
      Future.delayed(const Duration(seconds: 1));
      ScaffoldMessenger.of(context).showSnackBar(imageSelectedSnackBar());
    } 

    return Form(
      child: Column(
        children: [
          const SizedBox(height: 25),
          CustomTextFormField(
              controller: fullNameController, lable: 'Full Name'),
          const SizedBox(height: 5),
          CustomTextFormField(
              controller: idNumberController,
              lable: 'Id Number',
              keyboardType: TextInputType.number),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 10, 150, 163))),
                onPressed: imagePick,
                child: const Text('Select Image'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 10, 150, 163))),
                onPressed: studentDetailsAdd,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void studentDetailsAdd() {
    bloc.add(
      AddStudentSaveButtonEvent(
        studentProfileImage: compressedImage,
        fullname: fullNameController.text,
        idNumber: int.parse(idNumberController.text),
      ),
    );
  }
}
