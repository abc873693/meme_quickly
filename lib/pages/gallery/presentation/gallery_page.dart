import 'dart:convert';
import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme_quickly/pages/gallery/domain/subtitle_model.dart';
import 'package:meme_quickly/pages/gallery/presentation/frame_slider_page.dart';

class ImageGridPage extends StatefulWidget {
  const ImageGridPage({super.key});

  @override
  ImageGridPageState createState() => ImageGridPageState();
}

class ImageGridPageState extends State<ImageGridPage> {
  String searchText = '';
  final subtitleList = <SubtitleModel>[];
  var filteredItems = <SubtitleModel>[];

  @override
  void initState() {
    _loadModel();
    super.initState();
  }

  Future<void> _loadModel() async {
    final value = await rootBundle.load('assets/output.json');
    final jsonString = utf8.decode(value.buffer.asUint8List());
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    log(jsonData['subtitles'].runtimeType.toString());
    if (jsonData['subtitles'] case List<dynamic> list) {
      for (final map in list) {
        final subtitle = SubtitleModel.fromJson(map);
        subtitleList.add(subtitle);
      }
    } else {
      throw Exception('Failed to load subtitles');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter items based on searchText

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Grid'),
        actions: [Text('subtitle count = ${subtitleList.length}')],
      ),
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
                  filteredItems =
                      subtitleList.where((item) {
                        return item.text.toString().contains(searchText);
                      }).toList();
                });

                log('filter count = ${filteredItems[111].text}');
                log('filter count = ${filteredItems.length}');
              },
            ),
          ),
          if (searchText.isEmpty)
            Offstage()
          else
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
                  final imageName =
                      'ZhenHuan_${item.episode}_${item.startFrame}.jpg';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FrameSliderPage(model: item),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          item.text,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      child: Image.network(
                        'https://me.rainvisitor.me/$imageName',
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
