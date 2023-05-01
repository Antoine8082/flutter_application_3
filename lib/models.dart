class Wizard {
  final String id;
  final String firstName;
  final String lastName;

  Wizard({required this.id, required this.firstName, required this.lastName});

  factory Wizard.fromJson(Map<String, dynamic> json) {
    return Wizard(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }
}

class Elixir {
  final String id;
  final String name;
  final String description;

  Elixir({required this.id, required this.name, required this.description});

  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
