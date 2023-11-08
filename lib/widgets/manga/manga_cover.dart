import 'package:flutter/material.dart';
import 'package:flutteryomi/models/utils/manga_cover.dart' as manga_cover_data;

class MangaCover extends StatelessWidget {
  static const squareRatio = 1.0;
  static const bookRatio = 2.0 / 3.0;

  const MangaCover({
    super.key,
    this.contentDescription = "",
    required this.data,
    required this.ratio,
    //required this.shape,
  });

  const MangaCover.square({
    super.key,
    required this.contentDescription,
    required this.data,
  }) : ratio = squareRatio;

  const MangaCover.book({
    super.key,
    required this.contentDescription,
    required this.data,
  }) : ratio = bookRatio;

  final String contentDescription;
  //final ImageProvider<Object> image;
  final manga_cover_data.MangaCover data;
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
    return AspectRatio(
      aspectRatio: ratio,
      child: const Placeholder(
        color: Color(0x1F888888),
      ),
    );
  }
}
