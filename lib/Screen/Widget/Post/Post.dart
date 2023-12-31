import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.screenW,
    required this.screenH,
    required this.date,
    required this.description,
    required this.image,
    required this.titre,
    required this.categories,
    required this.index,
    required this.par,
  }) : super(key: key);

  final double screenW;
  final double screenH;
  final String image;
  final String titre;
  final String description;
  final String date;
  final String categories;
  final int index;
  final String par;
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    Divider(
      color: Colors.blue.shade400,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/asset/david.jpg',
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                //  'Moise Vangi',
                '${widget.titre}',
                // post.descrip,
                textAlign: TextAlign.end,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(left: 3)),
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/R.png',
                ),
                radius: 8,
              ),
            ],
          ),
        ),
        Text(
          "${widget.description}",
          // post.descrip,
          textAlign: TextAlign.justify,
          maxLines: 2,
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
        ),
        const Text(
          'Lire plus...',
          textAlign: TextAlign.justify,
          maxLines: 2,
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: screenH * 0.03,
        ),
        Image.network(
          'http://192.168.223.195/test/postimages/${widget.image}',
          height: screenH * 0.4,
          width: screenW,
          fit: BoxFit.cover,
        ),
        Divider(
          color: Colors.blue.shade400,
        ),
      ],
    );
  }
}
