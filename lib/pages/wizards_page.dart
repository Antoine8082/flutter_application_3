import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/elixirs_page.dart';
import 'package:flutter_application_3/models/models.dart';
import 'package:flutter_application_3/services/services.dart';

class WizardsPage extends StatefulWidget {
  const WizardsPage({Key? key}) : super(key: key);

  @override
  _WizardsPageState createState() => _WizardsPageState();
}

class _WizardsPageState extends State<WizardsPage> {
  late Future<List<Wizard>> _futureWizards;

  @override
  void initState() {
    super.initState();
    _futureWizards = WizardService.fetchWizards();
  }

  void _navigateToElixirsPage(BuildContext context, Wizard wizard) async {
    final elixirs = await ElixirService.fetchElixirs(wizard.lastName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ElixirsPage(elixirs: elixirs),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wizard List'),
      ),
      body: FutureBuilder<List<Wizard>>(
        future: _futureWizards,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final wizards = snapshot.data!;
            return ListView.builder(
              itemCount: wizards.length,
              itemBuilder: (context, index) {
                final wizard = wizards[index];
                return Card(
                  child: ListTile(
                    title: Text(wizard.firstName.isNotEmpty == true
                        ? '${wizard.firstName} ${wizard.lastName}'
                        : wizard.lastName),
                    onTap: () => _navigateToElixirsPage(context, wizard),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
