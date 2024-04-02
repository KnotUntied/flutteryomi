import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/source/local/local_source.dart';

//TODO
class SourceIcon extends StatelessWidget {
  const SourceIcon({super.key, required this.source});

  final Source source;

  @override
  Widget build(BuildContext context) {
    //final icon = source.icon;
    //if (source.isStub && icon == null) {
    //  return Image(
    //    image: Icons.warning,
    //    colorFilter: ColorFilter.tint(Theme.of(context).colorScheme.error),
    //  );
    //} else if (icon != null) {
    //  return Image(
    //    bitmap: icon,
    //  );
    //} else
    if (source.isLocal()) {
      return const Image(
        image: AssetImage('assets/images/local_source.webp'),
      );
    } else {
      return const Image(
        image: AssetImage('assets/images/default_source.webp'),
      );
    }
  }
}
