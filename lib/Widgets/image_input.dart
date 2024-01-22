import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});
  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  void takeImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    }
    );
    widget.onPickImage(_selectedImage!);
  }

  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    Widget mainContent = TextButton.icon(
        onPressed: takeImage,
        icon: Icon(Icons.camera),
        label: Text('Add Image'));

    if (_selectedImage != null) {
      mainContent = Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    }

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.primary)),
      alignment: Alignment.center,
      height: 250,
      width: double.infinity,
      child: mainContent,
    );
  }
}
