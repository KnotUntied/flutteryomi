import 'package:flutter/material.dart';

import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/presentation/components/material/constants.dart';

class TrackLogoIcon extends StatelessWidget {
  const TrackLogoIcon({
    super.key,
    required this.tracker,
    this.onClick,
  });

  final Tracker tracker;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          color: Color(tracker.getLogoColor()),
          borderRadius: BorderRadius.circular(MaterialPadding.medium),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          //TODO
          'todo',
          semanticLabel: tracker.name,
          //image: null,
          //tracker.getLogo(),
        ),
      ),
    );
  }
}
