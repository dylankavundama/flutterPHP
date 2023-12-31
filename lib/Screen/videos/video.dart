import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  VideoApp({required this.img, Key? key});

  final String img;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.img)
      ..initialize().then((_) {
        setState(() {});
      });
  }
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      
       _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            )
          :
      
       SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                 Divider(
                  color: Colors.blue.shade400,
                ),
                Container(
                  height: screenHeight * 0.5,
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(),
                ),
                Positioned(
                  left: screenWidth * 0.85,
                  right: 0,
                  top: screenHeight * 0.4,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Container(
                      height: screenHeight * 0.08,
                      decoration:  BoxDecoration(
                          color: Colors.blue.shade400, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
             Divider(
              color: Colors.blue.shade400,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class PostVideoWidget extends StatelessWidget {
  const PostVideoWidget({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    required this.titre,
    required this.date,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final String image;
  final String titre;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Container(
        height: screenHeight * 0.25,
        width: screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              '${image}',
              fit: BoxFit.cover,
              height: screenHeight * 0.2,
              width: screenWidth / 2.5,
            ),
                 Divider(color: Colors.blue.shade400,),
            Container(
              height: screenHeight * 0.22,
              width: screenWidth / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    '${titre}',
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
             Divider(color: Colors.blue.shade400,),
                  Text(
                    'Poster le ${date}',
                    maxLines: 3,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
         
            ),
                 Divider(color: Colors.blue.shade400,),
          ],
        ),
        
      ),
    );
  }
}
