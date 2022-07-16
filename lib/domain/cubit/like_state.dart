part of 'like_cubit.dart';

@immutable
abstract class LikeState {}

class LikeInitial extends LikeState {}

class VideoLiked extends LikeState {}

class VideoUnliked extends LikeState {}
