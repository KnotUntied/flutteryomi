import 'package:flutter/material.dart';

class PageIndicatorText extends StatelessWidget {
  const PageIndicatorText({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    if (currentPage <= 0 || totalPages <= 0) return const SizedBox.shrink();
    final text = "$currentPage / $totalPages";
    return Stack(
      children: <Text>[
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4.0
              ..color = Color.fromARGB(255, 45, 45, 45),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Color.fromARGB(255, 235, 235, 235),
          ),
        ),
      ],
    );
  }
}
