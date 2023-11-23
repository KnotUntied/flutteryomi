import 'package:flutter/material.dart';
import 'package:flutteryomi/data/utils/manga_cover.dart' as manga_cover_data;

class MangaCover extends StatelessWidget {
  static const squareRatio = 1.0;
  static const bookRatio = 2.0 / 3.0;

  const MangaCover({
    super.key,
    this.contentDescription = "",
    required this.data,
    required this.ratio,
    this.onClick,
  });

  const MangaCover.square({
    super.key,
    this.contentDescription = "",
    required this.data,
    this.onClick,
  }) : ratio = squareRatio;

  const MangaCover.book({
    super.key,
    this.contentDescription = "",
    required this.data,
    this.onClick,
  }) : ratio = bookRatio;

  final String contentDescription;
  //final ImageProvider<Object> image;
  final manga_cover_data.MangaCover data;
  final double ratio;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    //return AspectRatio(
    //  aspectRatio: ratio,
    //  child: FadeInImage.assetNetwork(
    //    fit: BoxFit.cover,
    //    image: image,
    //    placeholder: "",
    //    placeholderFit: BoxFit.cover,
    //  ),
    //);
    return InkWell(
      onTap: onClick,
      child: AspectRatio(
        aspectRatio: ratio,
        child: const Placeholder(
          color: _coverPlaceholderColor,
        ),
      ),
    );
  }
}

const _coverPlaceholderColor = Color(0x1F888888);
