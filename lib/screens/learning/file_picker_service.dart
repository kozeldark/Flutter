import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<Uint8List> imageFilePickAsBytes() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom, withData: true,
      allowedExtensions: ['jpg', 'png']
    );

    if (result != null) {
      Uint8List  file = result.files.single.bytes;
      return file;
    } else {
      return null;
    }
  }
}