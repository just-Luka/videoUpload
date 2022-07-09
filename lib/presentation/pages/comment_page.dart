import 'package:blindside_task/domain/cubit/comment_cubit.dart';
import 'package:blindside_task/presentation/frames/center_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenterFrame(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              TextField(
                controller: _commentController,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                style: GoogleFonts.josefinSans(
                  color: Colors.white,
                  fontSize: 19,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: 'Enter your Comment here!',
                  hintStyle: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      '\tBack',
                      style: GoogleFonts.josefinSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CommentCubit>(context)
                            .pushComment(_commentController.text.toString());
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(246, 198, 152, 1),
                        shadowColor: const Color.fromRGBO(246, 198, 152, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'Publish',
                        style: GoogleFonts.josefinSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
