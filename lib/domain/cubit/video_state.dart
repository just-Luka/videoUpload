part of 'video_cubit.dart';

@immutable
abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoUploaded extends VideoState {
  List<File> files;
  VideoUploaded({
    required this.files,
  });
}

class VideoUploadFailed extends VideoState {}
