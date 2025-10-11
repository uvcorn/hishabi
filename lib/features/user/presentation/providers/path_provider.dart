import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Future<String> saveProfileImage(File pickedImage) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileName = path.basename(pickedImage.path); // keep original name
  final savedImage = await pickedImage.copy('${appDir.path}/$fileName');
  return savedImage.path;
}
