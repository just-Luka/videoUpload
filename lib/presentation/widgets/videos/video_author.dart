import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoAuthor extends StatelessWidget {
  const VideoAuthor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/pics/profile_pic2.jpeg'),
          radius: 22,
        ),
        title: Text(
          'Video title',
          style: GoogleFonts.josefinSans(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'Amazing video description',
          style: GoogleFonts.josefinSans(
            fontSize: 14,
            color: Colors.grey.shade400,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            print('pressed');
          },
          iconSize: 28,
          color: Colors.white,
        ),
      ),
    );
  }
}
