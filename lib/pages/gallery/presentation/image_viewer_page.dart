import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meme_quickly/config/config.dart';
import 'package:meme_quickly/pages/gallery/domain/subtitle_model.dart';

class ImageViewerPage extends StatefulWidget {
  final SubtitleModel model;

  const ImageViewerPage({super.key, required this.model});

  @override
  State<ImageViewerPage> createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  @override
  Widget build(BuildContext context) {
    final imageName =
        'ZhenHuan_${widget.model.episode}_${widget.model.startFrame}.jpg';
    final url = 'https://$thumbHost/$imageName';
    return Scaffold(
      appBar: AppBar(
        title: Text('EP ${widget.model.episode}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download_outlined),
            onPressed: () async {
              try {
                final response = await http.get(Uri.parse(url));
                if (response.statusCode == 200) {
                  await FileSaver.instance.saveFile(
                    name: url,
                    bytes: response.bodyBytes,
                  );
                } else {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to load image')),
                  );
                }
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error loading image: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.network(
              url,
              // Assumes images are in assets/images
              headers: {
                'Access-Control-Allow-Origin': 'https://abc873693.github.io/',
              },
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: MediaQuery.paddingOf(context).bottom + 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8.0),
                Text(
                  widget.model.text,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(width: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
