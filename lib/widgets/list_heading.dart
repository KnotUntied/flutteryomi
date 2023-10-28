import 'package:flutter/material.dart';


class ListHeading extends StatelessWidget {
  const ListHeading(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        data,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
