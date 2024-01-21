import 'package:flutter/widgets.dart';

class DotSeparatorText extends StatelessWidget {
  const DotSeparatorText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(" • ");
  }
}

class DotSeparatorNoSpaceText extends StatelessWidget {
  const DotSeparatorNoSpaceText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("•");
  }
}
