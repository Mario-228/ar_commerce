import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<File> convertAssetImageToFile(String assetPath, String fileName) async {
  final ByteData data = await rootBundle.load(assetPath);
  final Uint8List bytes = data.buffer.asUint8List();

  final Directory directory = await getApplicationDocumentsDirectory();
  final String path = directory.path;
  var path2 = '$path/$fileName';
  path2 = path2.replaceAll('\\', '/');
  final File file = File(path2);
  await file.writeAsBytes(bytes);
  print(file.path);
  return file;
}
