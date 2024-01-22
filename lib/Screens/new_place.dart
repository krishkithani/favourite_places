import 'dart:io';

import 'package:favourite_places/Provider/list_provider.dart';
import 'package:favourite_places/Widgets/image_input.dart';
import 'package:favourite_places/Widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final textController = TextEditingController();
  File? selectedImage;
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void addNewPlace() {
    final enteredText = textController.text;

    if (enteredText.isEmpty || selectedImage == null) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredText, selectedImage!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Add Item '),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20),
                  decoration: const InputDecoration(
                    label: Text(
                      "Title",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  controller: textController,
                ),
                const SizedBox(
                  height: 10,
                ),
                ImageInput(
                  onPickImage: (image) {
                    selectedImage = image;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //LocationInput(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: addNewPlace,
                    child: const Text("Add Place"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
