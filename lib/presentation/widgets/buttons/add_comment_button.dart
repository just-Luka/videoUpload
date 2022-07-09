import 'package:blindside_task/presentation/pages/comment_page.dart';
import 'package:flutter/material.dart';

class AddCommentButton extends StatelessWidget {
  const AddCommentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Colors.white,
      backgroundColor: const Color.fromRGBO(246, 198, 152, 1),
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CommentPage(),
          ),
        );
      },
      child: const Icon(
        Icons.edit_note,
        color: Colors.black,
        size: 28,
      ),
    );
  }
}
