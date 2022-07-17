import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoComment extends StatelessWidget {
  final String commentText;

  const VideoComment({
    Key? key,
    required this.commentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/pics/profile_pic2.jpeg'),
              radius: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User',
                      style: GoogleFonts.josefinSans(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    commentText.length <= 85
                        ? Text(
                            commentText,
                            style: GoogleFonts.josefinSans(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade400,
                            ),
                          )
                        : RichText(
                            text: TextSpan(
                              text: commentText.substring(0, 85),
                              style: GoogleFonts.josefinSans(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade400,
                              ),
                              children: [
                                TextSpan(
                                  text: ' more ...',
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('expansion happens');
                                    },
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
