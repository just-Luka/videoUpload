import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSlider extends StatefulWidget {
  final VideoPlayerController playerController;

  const VideoSlider({
    Key? key,
    required this.playerController,
  }) : super(key: key);

  @override
  State<VideoSlider> createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {
  double _sliderValue = 0.0;
  int videoPosition = 0;
  int videoDuration = 0;

  @override
  void initState() {
    super.initState();
    videoDuration = widget.playerController.value.duration.inMilliseconds;
    videoPosition = widget.playerController.value.position.inMilliseconds;
    if (videoPosition > 0.0 && videoDuration > 0.0) {
      double percent = videoPosition / videoDuration;
      setState(() {
        _sliderValue = percent;
      });
    } else {
      setState(() {
        _sliderValue = 0;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateVideoPosition(double newValue) {
    setState(() {
      _sliderValue = newValue;
    });
    final Duration updatedVideoPosition =
        Duration(milliseconds: (newValue * videoDuration).toInt());

    widget.playerController.seekTo(updatedVideoPosition);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Slider(
        value: _sliderValue,
        onChanged: _updateVideoPosition,
        thumbColor: Colors.red,
        activeColor: Colors.red,
        inactiveColor: const Color.fromARGB(255, 155, 155, 155),
      ),
    );
  }
}
