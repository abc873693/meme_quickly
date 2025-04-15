import 'package:flutter/material.dart';
import 'package:meme_quickly/pages/gallery/domain/subtitle_data.dart';
import 'package:meme_quickly/pages/gallery/presentation/frame_slider_page.dart';

class ImageGridPage extends StatefulWidget {
  const ImageGridPage({super.key});

  @override
  ImageGridPageState createState() => ImageGridPageState();
}

class ImageGridPageState extends State<ImageGridPage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    // Filter items based on searchText
    final filteredItems =
        subtitles.where((item) {
          return item['text']!.toString().contains(searchText);
        }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Image Grid')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Display 3 images per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                final imageName = 'frame_${item['start_frame']}.jpg';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => FrameSliderPage(
                              subtitle: item['text']?.toString() ?? '',
                              startFrame: item['start_frame'] as int,
                              endFrame: item['end_frame'] as int,
                              startSeconds: item['start_seconds'] as double,
                              endSeconds: item['end_seconds'] as double,
                            ),
                      ),
                    );
                  },
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.black54,
                      title: Text(
                        item['text']!.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/$imageName',
                      // Assumes images are in assets/images
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
