import 'dart:async';

import 'package:blindside_task/presentation/widgets/sliders/video_slider.dart';
import 'package:blindside_task/presentation/widgets/videos/frames/video_frame_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class ZoomInVideoFrame extends StatefulWidget {
  final VideoPlayerController playerController;
  const ZoomInVideoFrame({
    Key? key,
    required this.playerController,
  }) : super(key: key);

  @override
  State<ZoomInVideoFrame> createState() => _ZoomInVideoFrameState();
}

class _ZoomInVideoFrameState extends State<ZoomInVideoFrame>
    with VideoFrameMixin {
  late bool _isVideoRun;
  bool _isVideoInFocus = false;
  Timer? _videoFocusTime;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    _isVideoRun = widget.playerController.value.isPlaying ? true : false;
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  void _videoInFocus() {
    _videoFocusTime?.cancel();

    setState(() {
      _isVideoInFocus = !_isVideoInFocus;
    });

    _videoFocusTime = Timer(
      const Duration(seconds: 3),
      () => setState(() {
        _isVideoInFocus = false;
      }),
    );
  }

  void _updateVideoRunState() {
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
      backgroundColor: const Color.fromARGB(255, 51, 51, 51),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Hero(
                tag: 'video',
                child: GestureDetector(
                  onTap: () {
                    _videoInFocus();
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: AspectRatio(
                          aspectRatio:
                              widget.playerController.value.aspectRatio,
                          child: VideoPlayer(widget.playerController),
                        )),
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: switchVideoAttributes(
                    _isVideoRun, _isVideoInFocus, _updateVideoRunState),
              ),
              _isVideoRun && !_isVideoInFocus
                  ? const SizedBox()
                  : Positioned(
                      bottom: 25,
                      left: 20,
                      child: SizedBox(
                        width: 700,
                        child: VideoSlider(
                          playerController: widget.playerController,
                        ),
                      ),
                    ),
              _isVideoRun && !_isVideoInFocus
                  ? const SizedBox()
                  : Positioned(
                      right: 0,
                      bottom: 0,
                      child: SafeArea(
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.zoom_in_map,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
            ],
          );
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: 'video',
              child: GestureDetector(
                onTap: () {
                  _videoInFocus();
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
              child: switchVideoAttributes(
                  _isVideoRun, _isVideoInFocus, _updateVideoRunState),
            ),
            _isVideoRun && !_isVideoInFocus
                ? const SizedBox()
                : Positioned(
                    bottom: 322,
                    left: 20,
                    child: VideoSlider(
                      playerController: widget.playerController,
                    ),
                  ),
            _isVideoRun && !_isVideoInFocus
                ? const SizedBox()
                : Padding(
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
                  ),
          ],
        );
      }),
    );
  }
}
