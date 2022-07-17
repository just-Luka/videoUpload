part of 'comment_cubit.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentShow extends CommentState {
  final List<String> comments;

  CommentShow({required this.comments});
}

class CommentHide extends CommentState {}
