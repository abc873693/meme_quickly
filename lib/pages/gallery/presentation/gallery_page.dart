import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme_quickly/config/config.dart';
import 'package:meme_quickly/pages/gallery/domain/subtitle_model.dart';
import 'package:meme_quickly/pages/gallery/presentation/image_viewer_page.dart';

class ImageGridPage extends StatefulWidget {
  const ImageGridPage({super.key});

  @override
  ImageGridPageState createState() => ImageGridPageState();
}

class ImageGridPageState extends State<ImageGridPage> {
  String searchText = '';
  final subtitleList = <SubtitleModel>[];
  var filteredItems = <SubtitleModel>[];
  bool isLoading = true;

  @override
  void initState() {
    _loadModel();
    super.initState();
  }

  Future<void> _loadModel() async {
    final value = await rootBundle.load('assets/output.json');
    final jsonString = utf8.decode(value.buffer.asUint8List());
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    if (jsonData['subtitles'] case List<dynamic> list) {
      for (final map in list) {
        final subtitle = SubtitleModel.fromJson(map);
        subtitleList.add(subtitle);
      }
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load subtitles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('甄嬛傳台詞'),
        actions: [
          Text(
            '總數 = ${subtitleList.length}'
            '${searchText.isNotEmpty && filteredItems.isNotEmpty ? ', 找到 = ${filteredItems.length}' : ''}',
          ),
          SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              enabled: !isLoading,
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
              },
            ),
          ),
          if (isLoading)
            const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16.0),
                  Text('載入台詞中...'),
                ],
              ),
            )
          else if (searchText.isEmpty)
            Text('請輸入關鍵字搜尋台詞')
          else
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.sizeOf(context).width ~/ 200)
                        .clamp(1, 6),
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    final imageName =
                        'ZhenHuan_${item.episode}_${item.startFrame + 10}.jpg';
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageViewerPage(model: item),
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
                          'https://$thumbHost/$imageName',
                          // Assumes images are in assets/images
                          headers: {
                            'Access-Control-Allow-Origin':
                                'https://abc873693.github.io/',
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
