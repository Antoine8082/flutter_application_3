import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/wizards_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wizard World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WizardsPage(),
    );
  }
}
