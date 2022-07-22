import 'package:blindside_task/presentation/widgets/painters/triangle_painter.dart';
import 'package:flutter/material.dart';

mixin VideoFrameMixin {
  Widget switchVideoAttributes(
      bool isVideoRun, bool isVideoInFocus, VoidCallback updateVideoRunState) {
    if (isVideoRun && isVideoInFocus) {
      return ElevatedButton(
        onPressed: () => updateVideoRunState(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
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
        child: const Icon(
          Icons.pause,
          size: 30,
        ),
      );
    } else if (!isVideoRun) {
      // !_isVideoRun, so video is paused;
      return ElevatedButton(
        onPressed: () => updateVideoRunState(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
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
      );
    }
    return const SizedBox();
  }
}
