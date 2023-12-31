import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newsapp/Screen/videos/youtube.dart';
import 'video.dart';
import 'package:http/http.dart' as http;

class ListVideo extends StatefulWidget {
  const ListVideo({Key? key}) : super(key: key);

  @override
  State<ListVideo> createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  List<dynamic> video = [];
  bool _isLoading = false;

  fetchvideos() async {
    setState(() {
      _isLoading = true;
    });
    const url = 'http://192.168.223.195/test/vvideo.php';
    final uri = Uri.parse(url);
    final reponse = await http.get(uri);
    final resultat = jsonDecode(reponse.body);
    video = resultat;
    debugPrint(reponse.body);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchvideos();
  }

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Mes Videos'),
      ),
      body:
      
       _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            )
          :
       SingleChildScrollView(
        child: Column(
          children: List.generate(
            video.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Youtube(videos: video[index]['PostDetails']),
                  ),
                );
              },
              child: PostVideoWidget(
                screenHeight: screenH,
                screenWidth: screenW,
                image: "http://192.168.223.195/test/postimages/" +
                    video[index]['PostImage'],
                titre: video[index]['PostTitle'],
                date: video[index]['PostingDate'],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class videoWidget extends StatelessWidget {
  const videoWidget({
    required this.image,
    required this.video,
    required this.titre,
    Key? key,
  }) : super(key: key);

  final String image;
  final String video;
  final String titre;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Divider(
          color: Colors.blue.shade400,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                (MaterialPageRoute(builder: (context) {
                  return Youtube(videos: video);
                })));
          },
          child: Container(
            padding: EdgeInsets.all(19),
            child: Row(
              children: [
                Container(
                  height: 55,
                  child: Image.network(
                    'http://192.168.223.195/test/postimages${image}',
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('dd'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'ddd',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
             Divider(color: Colors.blue.shade400,),
      ],
    );
  }
}
