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
  double sliderValue = 0.0;
  int videoDuration = 0;

  @override
  void initState() {
    super.initState();
    widget.playerController.addListener(() {
      videoDuration = widget.playerController.value.duration.inMilliseconds;

      var current = widget.playerController.value.position.inMilliseconds;

      var percent = (current) / videoDuration;
      setState(() {
        sliderValue = percent;
      });
    });
  }

  @override
  void dispose() {
    widget.playerController.removeListener;
    super.dispose();
  }

  void _updateVideoPosition(double newValue) {
    setState(() {
      sliderValue = newValue;
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
        value: sliderValue,
        onChanged: _updateVideoPosition,
        thumbColor: Colors.red,
        activeColor: Colors.red,
        inactiveColor: const Color.fromARGB(255, 155, 155, 155),
      ),
    );
  }
}
