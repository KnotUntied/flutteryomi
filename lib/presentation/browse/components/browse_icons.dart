import 'package:flutter/material.dart';

import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/source/local/local_source.dart';

//TODO
class SourceIcon extends StatelessWidget {
  const SourceIcon({super.key, required this.source});

  final Source source;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40.0,
      height: 40.0,
      child: Placeholder(),
    );
    //final icon = source.icon;
    //const icon = null;
    //if (source.isStub && icon == null) {
    //  return Image(
    //    image: Icons.warning,
    //    colorFilter: ColorFilter.tint(Theme.of(context).colorScheme.error),
    //    modifier: modifier.then(defaultModifier),
    //  );
    //} else if (icon != null) {
    //  return Image(
    //    bitmap: icon,
    //    modifier: modifier.then(defaultModifier),
    //  );
    //} else if (source.isLocal()) {
    //  return Image(
    //    painter: painterResource(R.mipmap.ic_local_source),
    //    modifier: modifier.then(defaultModifier),
    //  );
    //} else {
    //  return Image(
    //    painter: painterResource(R.mipmap.ic_default_source),
    //    modifier: modifier.then(defaultModifier),
    //  );
    //}
  }
}
