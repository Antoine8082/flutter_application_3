import 'package:flutter/material.dart';
import 'package:flutter_application_3/models.dart';

class ElixirsPage extends StatelessWidget {
  final List<Map<String, dynamic>> elixirs;

  const ElixirsPage({Key? key, required this.elixirs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elixir List'),
      ),
      body: ListView.builder(
        itemCount: elixirs.length,
        itemBuilder: (context, index) {
          final elixir = elixirs[index];
          return Card(
            child: ListTile(
              title: Text(elixir['name'] ?? ''),
              subtitle: Text(elixir['description'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
