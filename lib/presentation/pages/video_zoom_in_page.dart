import 'package:blindside_task/presentation/widgets/painters/triangle_painter.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoZoomInPage extends StatefulWidget {
  final VideoPlayerController playerController;
  const VideoZoomInPage({
    Key? key,
    required this.playerController,
  }) : super(key: key);

  @override
  State<VideoZoomInPage> createState() => _VideoZoomInPageState();
}

class _VideoZoomInPageState extends State<VideoZoomInPage> {
  bool _isVideoRun = false;

  _updateVideoRunState() {
    setState(() {
      _isVideoRun = !_isVideoRun;
    });

    if (_isVideoRun == true) {
      widget.playerController.play();
    } else {
      widget.playerController.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'video',
            child: GestureDetector(
              onTap: () {
                _updateVideoRunState();
              },
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: AspectRatio(
                      aspectRatio: widget.playerController.value.aspectRatio,
                      child: VideoPlayer(widget.playerController),
                    )),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _isVideoRun
                ? const SizedBox()
                : ElevatedButton(
                    onPressed: () => _updateVideoRunState(),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black.withOpacity(0.1),
                      ),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey.shade400;
                          }
                        },
                      ),
                    ),
                    child: CustomPaint(
                      child: CustomPaint(
                        painter: TrianglePainter(
                          strokeColor: Colors.white,
                          strokeWidth: 10,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 28,
                        ),
                      ),
                    ),
                  ),
          ),
          !_isVideoRun
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 325,
                    top: 150,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.zoom_in_map,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
