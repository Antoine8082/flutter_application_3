import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_application_3/models/models.dart';

class WizardService {
  static const String _baseUrl = 'https://wizard-world-api.herokuapp.com';

  static Future<List<Wizard>> fetchWizards() async {
    final response = await http.get(Uri.parse('$_baseUrl/wizards'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final wizards = List<Wizard>.from(data.map((json) => Wizard(
            id: json['id'],
            firstName: json['firstName'] ?? '',
            lastName: json['lastName'] ?? '',
          )));
      return wizards;
    } else {
      throw Exception('Failed to fetch wizards');
    }
  }
}

class ElixirService {
  static const String _baseUrl = 'https://wizard-world-api.herokuapp.com';

  static Future<List<Map<String, dynamic>>> fetchElixirs(
      String wizardLastName) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/Elixirs?InventorFullName=$wizardLastName'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data.map((json) => json));
    } else {
      throw Exception('Failed to fetch elixirs');
    }
  }
}
