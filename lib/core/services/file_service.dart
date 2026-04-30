import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class FileService {
  static final ImagePicker _picker = ImagePicker();


  static Future<XFile?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      if (kDebugMode) {
        print('Error picking image: $e');
      }
      return null;
    }
  }
}