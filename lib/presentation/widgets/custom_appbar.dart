import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      leading: Image.asset(
        'assets/pics/video_pic1.png',
      ),
      pinned: false,
      elevation: 0,
      title: Align(
        alignment: Alignment.bottomLeft,
        heightFactor: 1.3,
        child: Text(
          'Blindside Videos',
          style: GoogleFonts.josefinSans(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      actions: const [
        Icon(
          Icons.manage_search,
          size: 32,
        ),
      ],
    );
  }
}
