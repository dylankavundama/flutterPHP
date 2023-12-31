import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newsapp/Screen/videos/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  const Youtube({required this.videos, Key? key}) : super(key: key);

  final String videos;

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  late YoutubePlayerController controller;

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
    String url = widget.videos;
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags:
            const YoutubePlayerFlags(mute: false, loop: false, autoPlay: true));
  }

  @override
  void deactivate() {
    controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: screenH * 0.4,
            child: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              video.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Youtube(videos: video[index]['PostDetails']),
                      ));
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
          )
        ]),
      ),
    );
  }
}
