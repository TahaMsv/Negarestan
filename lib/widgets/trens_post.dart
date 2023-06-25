import 'package:flutter/material.dart';

import '../core/constants/route_names.dart';
import '../screens/home/home_controller.dart';

class TrendPostsList extends StatelessWidget {
  const TrendPostsList({
    super.key,
    required this.galleryWidth,
    required this.posts,  this.numberOfPosts = 25,
  });

  final double galleryWidth;
  final List posts;
  final int numberOfPosts;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        numberOfPosts,
        (index) => GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: galleryWidth / 3,
            width: galleryWidth / 3,
            // color: MyColors.blueAccent,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              // color: MyColors.white,
              border: Border.all(
                // color: Colors.black26,
                width: 1.0,
              ),
            ),
            child: Image(
              height: galleryWidth / 3,
              width: galleryWidth / 3,
              image: AssetImage(posts[index % 7]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
