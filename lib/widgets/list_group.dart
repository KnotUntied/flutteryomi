import 'package:flutter/material.dart';


class ListGroup extends StatelessWidget {
  const ListGroup({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
