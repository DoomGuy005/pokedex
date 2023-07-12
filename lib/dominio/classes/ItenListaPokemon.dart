class ItenListaPokemon {
  final String name;

  const ItenListaPokemon({
    required this.name
  });

  factory ItenListaPokemon.fromJson(Map<String, dynamic> json) {
    return ItenListaPokemon(
        name: json['name']
    );
  }

  @override
  String toString() {
    return "Pokemon: $name";
  }
}