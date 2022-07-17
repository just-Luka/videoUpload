import 'package:blindside_task/presentation/pages/video_page.dart';
import 'package:blindside_task/presentation/widgets/videos/video_author.dart';
import 'package:flutter/material.dart';

class VideoRelatedBundle extends StatelessWidget {
  const VideoRelatedBundle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        children: [
          // const VideoAuthor(),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.06),
            child: Column(
              children: [
                InkWell(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const VideoPage(),
                  //   ),
                  // ),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 158, 158, 158),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
