import 'package:flutter/material.dart';

import 'information.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Information(version: '1.0.0'),
        Information(version: '1.0.0', size: '42 Mb'),
        Information(version: '1.0.0', size: '42 Mb', date: 'Jul 3 2023'),
      ]),
    );
  }
}
