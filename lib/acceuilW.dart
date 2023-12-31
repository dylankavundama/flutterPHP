import 'package:flutter/material.dart';
import 'post.dart';


class PostOnlyWidget extends StatelessWidget {
  const PostOnlyWidget(
      {Key? key,
      required this.screenH,
      required this.screenW,
      required this.post})
      : super(key: key);

  final double screenH;
  final double screenW;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.descrip,
          textAlign: TextAlign.justify,
          maxLines: 2,
          style: const TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: screenH * 0.02,
        ),
        Image.asset(
          post.image,
          height: screenH * 0.4,
          width: screenW,
          fit: BoxFit.cover,
        ),
        Container(
          height: screenH * 0.07,
          width: screenW,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.message,
                            color: Colors.black,
                            size: 18,
                          )),
                      Text(
                        '${post.comment}',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                      Text(
                        post.like,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
