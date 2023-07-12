class ItenPokedex {
  final int number;
  final String name;
  final String species;
  final int gen;
  final String description;

  const ItenPokedex({
    required this.number,
    required this.name,
    required this.species,
    required this.gen,
    required this.description
  });

  factory ItenPokedex.fromJson(Map<String, dynamic> json) {
    return ItenPokedex(
      number: json['number'],
      name: json['name'],
      species: json['species'],
      gen: json['gen'],
      description: json['description']
    );
  }
}