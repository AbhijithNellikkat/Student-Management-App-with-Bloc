import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function(File image) onImagePicked;

  ImagePickerWidget({required this.onImagePicked});

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      onImagePicked(File(pickedImage.path));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => _pickImage(ImageSource.gallery),
          child: Text('Pick from Gallery'),
        ),
        ElevatedButton(
          onPressed: () => _pickImage(ImageSource.camera),
          child: Text('Take a Photo'),
        ),
      ],
    );
  }
}
