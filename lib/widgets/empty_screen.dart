import "dart:math";

import 'package:flutter/material.dart';
import 'package:flutteryomi/widgets/action_button.dart';

class EmptyScreenAction {
  const EmptyScreenAction({
    required this.text,
    required this.icon,
    required this.onClick,
  });

  final String text;
  final Icon icon;
  final VoidCallback onClick;
}

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    required this.message,
    this.actions,
  });

  final String message;
  final List<EmptyScreenAction>? actions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _errorFaces[Random().nextInt(_errorFaces.length)],
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          if (actions?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                children: [
                  for (var action in actions!)
                    ActionButton(
                      title: action.text,
                      icon: action.icon,
                      onClick: action.onClick,
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

const List<String> _errorFaces = [
  "(･o･;)",
  "Σ(ಠ_ಠ)",
  "ಥ_ಥ",
  "(˘･_･˘)",
  "(；￣Д￣)",
  "(･Д･。",
];
