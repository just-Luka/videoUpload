import 'dart:io';
import 'dart:typed_data';

class VideoModel {
  final Uint8List memoryImage;
  final File file;

  VideoModel({
    required this.file,
    required this.memoryImage,
  });
}
