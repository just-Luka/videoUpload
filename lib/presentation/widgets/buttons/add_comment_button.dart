import 'package:blindside_task/presentation/pages/comment_page.dart';
import 'package:flutter/material.dart';

class AddCommentButton extends StatelessWidget {
  const AddCommentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Colors.white,
      backgroundColor: const Color.fromRGBO(246, 198, 152, 1),
      onPressed: () {
        Navigator.of(context).push(_VideoZoomInRoute());
      },
      child: const Icon(
        Icons.edit_note,
        color: Colors.black,
        size: 28,
      ),
    );
  }
}

Route _VideoZoomInRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CommentPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500));
}
