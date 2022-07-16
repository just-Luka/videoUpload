import 'dart:io';
import 'dart:typed_data';

class VideoModel {
  final Uint8List memoryImage;
  final File file;
  final int likes;

  VideoModel({
    required this.file,
    required this.memoryImage,
    required this.likes,
  });
}
