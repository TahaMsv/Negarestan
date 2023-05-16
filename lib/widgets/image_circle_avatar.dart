import 'package:flutter/material.dart';

import '../core/constants/assets.dart';

class ImageCircleAvatar extends StatelessWidget {
  const ImageCircleAvatar({
    super.key,
    this.radius = 22,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 10),
      child: Center(
        child: CircleAvatar(
          radius: radius, // adjust the radius as needed
          backgroundImage: const AssetImage(AssetImages.admin_image), // or use AssetImage for local images
        ),
      ),
    );
  }
}
