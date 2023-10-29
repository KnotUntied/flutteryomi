import 'package:flutter/material.dart';


class ListHeading extends StatelessWidget {
  const ListHeading(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
