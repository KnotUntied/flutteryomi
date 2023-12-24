import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkIcon extends StatelessWidget {
  const LinkIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.url,
  });

  final String label;
  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: IconButton(
        icon: Icon(icon),
        style: IconButton.styleFrom(surfaceTintColor: Theme.of(context).colorScheme.primary),
        tooltip: label,
        onPressed: _launchUrl,
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri parsedUrl = Uri.parse(url);
    if (!await launchUrl(parsedUrl)) {
      throw Exception('Could not open $parsedUrl');
    }
  }
}
