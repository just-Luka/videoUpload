import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  List<String> comments = [];
  CommentCubit() : super(CommentInitial());

  void pushComment(String text) {
    comments.add(text);
    emit(CommentShow(comments: comments));
  }

  void toggleComment() {
    if (state is CommentShow) {
      emit(CommentHide());
    } else if (state is CommentHide || state is CommentInitial) {
      emit(CommentShow(comments: comments));
    }
  }
}
