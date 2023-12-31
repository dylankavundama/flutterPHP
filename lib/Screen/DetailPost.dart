import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/Screen/Welcome.dart';
import 'package:newsapp/Screen/Widget/Post/Post.dart';
import 'package:http/http.dart' as http;

class DetailPost extends StatefulWidget {
  DetailPost(
      {required this.img,
      required this.detail,
      required this.date,
      required this.tit,
      required this.postedBy,
      Key? key})
      : super(key: key);
  final String img;
  final String tit;
  final String detail;
  final String date;
  final String postedBy;
  @override
  State<DetailPost> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  List<dynamic> post = [];
  bool _isLoading = false;
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
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: ScreenHeight * 0.5,
                  width: ScreenWidth,
                  
                  child: Image.network(
                    'http://192.168.223.195/test/postimages/${widget.img}',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 8,
                  right: 8,
                  top: 18,
                  bottom: 16,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ScreenWelcome();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.arrow_left_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenHeight * 0.2,
                      ),
                    ],
                  ),
                ),
     
                Positioned(
                  top: ScreenHeight * 0.4,
                  left: 8,
                  right: 10,
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      '${widget.tit}',
                      maxLines: 3,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenHeight * 0.03,
            ),
            Container(
              height: ScreenHeight * 0.06,
              width: ScreenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Container(
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/asset/david.jpg"),
                          radius: 50,
                        ),
                        height: 80,
                        width: 30,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Posté par ${widget.postedBy}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 5)),
                          Text(
                            'Le ${widget.date}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Divider(
              color: Colors.black45,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.detail}',
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Container(
                    height: ScreenHeight * 0.04,
                    width: ScreenWidth * 0.4,
                    color: Colors.blue.shade400,
                    child: const Center(
                      child: Text(
                        'AUTRE POST',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
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
                            screenW: ScreenWidth,
                            screenH: ScreenHeight,
                            categories: "PLAIDOIRIE",
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
          ],
        ),
      ),
    );
  }
}
