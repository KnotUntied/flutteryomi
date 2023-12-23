import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 56.0),
          child: Placeholder(
            fallbackHeight: 64.0,
            fallbackWidth: 64.0,
          ),
        ),
        Divider(),
      ],
    );
  }
}
