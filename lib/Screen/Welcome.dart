import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newsapp/Screen/DetailPost.dart';
import 'package:newsapp/Screen/fondateur.dart';
import 'package:newsapp/Screen/videos/listVideo.dart';
import '../carous.dart';
import 'Widget/Post/Post.dart';
import 'Widget/Story/Stories.dart';
import 'package:http/http.dart' as http;

class ScreenWelcome extends StatefulWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  State<ScreenWelcome> createState() => _ScreenWelcomeState();
}

class _ScreenWelcomeState extends State<ScreenWelcome> {
  List<dynamic> story = [];
  List<dynamic> post = [];
  bool _isLoading = false;
  fetchLocal() async {
    setState(() {
      _isLoading = true;
    });

    const url = 'http://192.168.223.195/test/vstory.php';

    final uri = Uri.parse(url);
    final reponse = await http.get(uri);
    final resultat = jsonDecode(reponse.body);
    story = resultat;
    debugPrint(reponse.body);
    setState(() {
      _isLoading = true;
    });
  }

  fetchPosts() async {
    setState(() {
      _isLoading = true;
    });

    const url = 'http://192.168.223.195/test/vpost.php';
    final uri = Uri.parse(url);
    final reponse = await http.get(uri);
    final resultat = jsonDecode(reponse.body);
    post = resultat;
    debugPrint(reponse.body);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLocal();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.blue.shade400,
        backgroundColor: Colors.white,
        title: const Text(
          //  'Suivez Nos Actualité',
          'Leeds News',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              height: screenH * 0.2,
              width: screenW,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [],
              )),
            ),
            SizedBox(
              height: screenH * 0.03,
            ),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('ADMIN'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              leading: const Icon(
                Icons.menu,
              ),
              title: const Text('ACCEUIL'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Fondateur();
                }));
              },
              leading: const Icon(
                Icons.foundation,
              ),
              title: Text('FONDATEUR'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListVideo();
                }));
              },
              leading: const Icon(
                Icons.video_call,
              ),
              title: const Text('VIDEO'),
            ),
            ListTile(
                onTap: () => Navigator.of(context).pop(),
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text('QUITTER')),
          ]),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowCarouselPage(
                              img: 'assets/asset/david.jpg',
                            );
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            story.length,
                            (index) => StoryWidget(
                                screenH: screenH,
                                screenW: screenW,
                                image:
                                    "http://192.168.223.195/test/postimages/" +
                                        story[index]['image']),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenH * 0.04),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          post.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailPost(
                                  tit: post[index]['PostTitle'],
                                  img: post[index]['PostImage'],
                                  detail: post[index]['PostDetails'],
                                  date: post[index]['PostingDate'],
                                  postedBy: post[index]['postedBy'],
                                );
                              }));
                            },
                            child: PostWidget(
                              screenW: screenW,
                              screenH: screenH,
                              categories: 'POLITIQUE',
                              description: post[index]['PostDetails'],
                              date: post[index]['PostingDate'],
                              index: index + 1,
                              titre: post[index]['postedBy'],
                              image: post[index]['PostImage'],
                              par: post[index]['postedBy'],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
