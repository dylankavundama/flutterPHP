import 'package:flutter/material.dart';
import 'package:newsapp/Screen/Welcome.dart';
import 'package:newsapp/Screen/fondateur.dart';
import 'package:newsapp/Screen/videos/listVideo.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  List<Widget> screen = [
    const ScreenWelcome(),
    const ListVideo(),
    Fondateur(),
    Fondateur(),

  ];
  void _listbotton(int index) {
    currentindex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: ContainerUI()),
      body: Container(),
      bottomSheet: screen[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          // showSelectedLabels: false,
          currentIndex: currentindex,
          selectedItemColor: Colors.orange,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 18,
                  color: Colors.black,
                ),
                label: 'Acceuil',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection_sharp,
                  size: 18,
                  color: Colors.black,
                ),
                label: 'Videos',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 18,
                  color: Colors.black,
                ),
                label: 'Portfolio',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.share,
                  size: 18,
                  color: Colors.black,
                ),
                label: 'Partager',
                backgroundColor: Colors.white),
          ]),
    );
  }
}
