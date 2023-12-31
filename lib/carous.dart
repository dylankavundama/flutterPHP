import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsapp/Screen/Welcome.dart';
class ShowCarouselPage extends StatefulWidget {
  ShowCarouselPage({
    required this.img,
    Key? key}) : super(key: key);
  final String img;

  @override
  State<ShowCarouselPage> createState() => _ShowCarouselPageState();
}

class _ShowCarouselPageState extends State<ShowCarouselPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), page);
  }

  page() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ScreenWelcome();
    }));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Image.asset(
      widget.img,
      height: screenHeight,
      width: screenWidth,
      fit: BoxFit.cover,
    );
  }
}
