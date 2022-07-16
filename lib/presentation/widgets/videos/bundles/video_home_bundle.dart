import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:blindside_task/data/video_model.dart';
import 'package:blindside_task/presentation/pages/video_page.dart';
import 'package:blindside_task/presentation/widgets/dividers/video_divider.dart';
import 'package:blindside_task/presentation/widgets/videos/video_author.dart';
import 'package:blindside_task/presentation/widgets/videos/video_metadata.dart';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoHomeBundle extends StatefulWidget {
  final File file;

  const VideoHomeBundle({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  State<VideoHomeBundle> createState() => _VideoHomeBundleState();
}

class _VideoHomeBundleState extends State<VideoHomeBundle> {
  late Uint8List _uint8list;

  Future showThumbnail() async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: widget.file.path,
      imageFormat: ImageFormat.JPEG,
    );

    _uint8list = uint8list!;
  }

  final likes = Random().nextInt(120);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Column(
        children: [
          const VideoAuthor(),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.06),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPage(
                        videoModel: VideoModel(
                          file: widget.file,
                          memoryImage: _uint8list,
                          likes: likes,
                        ),
                      ),
                    ),
                  ),
                  child: FutureBuilder(
                    future: showThumbnail(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: MemoryImage(_uint8list),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    }),
                  ),
                ),
                FutureBuilder(
                    future: showThumbnail(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return VideoMetaData(
                          videoModel: VideoModel(
                            file: widget.file,
                            memoryImage: _uint8list,
                            likes: likes,
                          ),
                        );
                      }
                      return const SizedBox();
                    }),
                const VideoDivider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
