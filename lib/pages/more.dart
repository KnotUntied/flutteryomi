import 'package:flutter/material.dart';


class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalizations.of(context)!.label_more),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            //Navigator.push(
            //  context,
            //  MaterialPageRoute(builder: (context) => const SecondRoute()),
            //);
          },
        ),
      ),
    );
  }
}