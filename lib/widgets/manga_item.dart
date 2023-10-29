import 'package:flutter/material.dart';


class MangaCompactGridItem extends StatelessWidget {
  const MangaCompactGridItem({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return const GridTile(
      //title: Text(
      //  title,
      //  style: Theme.of(context).textTheme.titleSmall,
      //),
      child: Placeholder(),
    );
  }
}
