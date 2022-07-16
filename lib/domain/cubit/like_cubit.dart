import 'package:blindside_task/domain/cubit/video_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeInitial());

  void toggleLike() {
    if (state is VideoLiked) {
      emit(VideoUnliked());
    } else if (state is VideoUnliked || state is VideoInitial) {
      emit(VideoLiked());
    }
  }
}
