import 'package:flutter/material.dart';

import 'package:flutteryomi/presentation/components/material/constants.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
    required this.icon,
    required this.headingText,
    required this.subtitleText,
    required this.acceptText,
    this.onAcceptClick,
    this.rejectText,
    this.onRejectClick,
    required this.content,
  });

  final IconData icon;
  final String headingText;
  final String subtitleText;
  final String acceptText;
  final VoidCallback? onAcceptClick;
  final String? rejectText;
  final VoidCallback? onRejectClick;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Top border line?
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: MaterialPadding.medium,
          vertical: MaterialPadding.small,
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onAcceptClick,
                child: Text(acceptText),
              ),
            ),
            if (rejectText != null && onRejectClick != null)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onRejectClick,
                  child: Text(rejectText!),
                ),
              ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0) +
            const EdgeInsets.symmetric(horizontal: MaterialPadding.medium),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Icon(
                icon,
                size: 48.0,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(headingText, style: Theme.of(context).textTheme.headlineLarge),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: MaterialPadding.small),
              child: Text(
                subtitleText,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.color
                          ?.withOpacity(
                            secondaryItemAlpha,
                          ),
                    ),
              ),
            ),
            ...content,
          ],
        ),
      ),
    );
  }
}
