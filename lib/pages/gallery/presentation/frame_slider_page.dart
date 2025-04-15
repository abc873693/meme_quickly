import 'package:flutter/material.dart';

class FrameSliderPage extends StatefulWidget {
  final int startFrame;
  final int endFrame;

  const FrameSliderPage({
    super.key,
    required this.startFrame,
    required this.endFrame,
  });

  @override
  State<FrameSliderPage> createState() => _FrameSliderPageState();
}

class _FrameSliderPageState extends State<FrameSliderPage> {
  late int currentFrame;

  @override
  void initState() {
    super.initState();
    currentFrame = widget.startFrame; // Initialize with the start frame
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frame Viewer')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/frame_$currentFrame.jpg',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Image not found');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Frame: $currentFrame'),
                Slider(
                  value: currentFrame.toDouble(),
                  min: widget.startFrame.toDouble(),
                  max: widget.endFrame.toDouble(),
                  divisions: widget.endFrame - widget.startFrame,
                  label: currentFrame.toString(),
                  onChanged: (value) {
                    setState(() {
                      currentFrame = value.toInt();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
