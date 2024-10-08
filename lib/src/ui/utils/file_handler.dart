import 'package:form_builder_file_picker/form_builder_file_picker.dart';

Future<List<PlatformFile>?> pickFile({
  List<String>? allowedExtensions,
}) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      return result.files;
    } else {
      return null;
    }
  } catch (e) {
    print('Error picking file: $e');
    return null;
  }
}

Future clearFileCache() async {
  await FilePicker.platform.clearTemporaryFiles();
}