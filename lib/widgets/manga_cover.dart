import 'package:flutter/material.dart';

class MangaCover extends StatelessWidget {
  const MangaCover({
    super.key,
    this.contentDescription = "",
    required this.image,
    required this.ratio,
    //required this.shape,
  });

  const MangaCover.square({
    super.key,
    required this.contentDescription,
    required this.image,
  }) : ratio = 1.0;

  const MangaCover.book({
    super.key,
    required this.contentDescription,
    required this.image,
  }) : ratio = 2.0 / 3.0;

  final String contentDescription;
  //final ImageProvider<Object> image;
  final String image;
  final double ratio;
  //final double shape;

  @override
  Widget build(BuildContext context) {
    //https://github.com/tachiyomiorg/tachiyomi/blob/master/app/src/main/java/eu/kanade/presentation/manga/components/MangaCover.kt#L18
    //return AspectRatio(
    //  aspectRatio: ratio,
    //  child: FadeInImage.assetNetwork(
    //    fit: BoxFit.cover,
    //    image: image,
    //    placeholder: "",
    //    placeholderFit: BoxFit.cover,
    //  ),
    //);
    return Center(
      child: AspectRatio(
        aspectRatio: ratio,
        child: const Placeholder(
          color: Color(0x1F888888),
        ),
      ),
    );
  }
}
