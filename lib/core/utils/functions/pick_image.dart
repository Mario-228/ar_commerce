import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> pickImage(ImageSource source) async {
  try {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return File('');
    }
  } catch (e) {
    return File('');
  }
}
