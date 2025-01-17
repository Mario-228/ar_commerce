import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<File> convertAssetImageToFile(String assetPath, String fileName) async {
  final ByteData data = await rootBundle.load(assetPath);
  final Uint8List bytes = data.buffer.asUint8List();

  final Directory directory = await getApplicationDocumentsDirectory();
  final String path = directory.path;
  final File file = File('$path/$fileName');
  await file.writeAsBytes(bytes);
  return file;
}
