import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  List<File> videos = [];
  VideoCubit() : super(VideoInitial());

  Future<void> uploadFile() async {
    XFile? xFile = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (xFile == null) return;

    videos.add(
      File(xFile.path),
    );
    emit(VideoUploaded(files: videos));
  }
}
