import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme_quickly/pages/gallery/domain/subtitle_model.dart';

class FrameSliderPage extends StatefulWidget {
  final SubtitleModel model;

  const FrameSliderPage({super.key, required this.model});

  @override
  State<FrameSliderPage> createState() => _FrameSliderPageState();
}

class _FrameSliderPageState extends State<FrameSliderPage> {
  late int currentFrame;

  @override
  void initState() {
    super.initState();
    currentFrame = widget.model.startFrame; // Initialize with the start frame
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
                Text(
                  widget.model.text,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${Duration(milliseconds: (widget.model.startSeconds * 1000).toInt())}',
                    ),
                    Spacer(),
                    Text('Frame: $currentFrame'),
                    SizedBox(width: 8.0),
                    IconButton(
                      icon: const Icon(Icons.file_download_outlined),
                      onPressed: () async {
                        await FileSaver.instance.saveFile(
                          name: 'frame_$currentFrame.jpg',
                          bytes: await rootBundle
                              .load('assets/images/frame_$currentFrame.jpg')
                              .then((value) => value.buffer.asUint8List()),
                        );
                      },
                    ),
                    Spacer(),
                    Text(
                      '${Duration(milliseconds: (widget.model.endSeconds * 1000).toInt())}',
                    ),
                  ],
                ),
                Slider(
                  value: currentFrame.toDouble(),
                  min: widget.model.startFrame.toDouble(),
                  max: widget.model.endFrame.toDouble(),
                  divisions: widget.model.endFrame - widget.model.startFrame,
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
