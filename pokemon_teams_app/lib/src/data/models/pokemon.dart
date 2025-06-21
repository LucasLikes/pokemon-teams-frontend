class Pokemon {
  final int id;
  final String pokemonIdentifier;
  final String name;
  final List<String> types;
  final String spriteUrl;

  final double? height; // em metros
  final double? weight; // em kg
  final Map<String, int>? stats; // ex: {'hp': 45, 'attack': 60}
  final List<String>? evolutions; // nomes ou identificadores

  Pokemon({
    required this.id,
    required this.pokemonIdentifier,
    required this.name,
    required this.types,
    required this.spriteUrl,
    this.height,
    this.weight,
    this.stats,
    this.evolutions,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final typesList = json['types'] as List<dynamic>? ?? [];
    final types = typesList.map((type) => type.toString()).toList();

    final statsMap = (json['stats'] as Map<String, dynamic>?)?.map(
      (key, value) => MapEntry(key, value as int),
    );

    final evolutionsList = json['evolutions'] as List<dynamic>?;

    return Pokemon(
      id: json['id'] as int,
      pokemonIdentifier: json['pokemonIdentifier'] as String? ?? '',
      name: json['name'] as String,
      types: types,
      spriteUrl: json['sprite'] as String? ?? '',
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      stats: statsMap,
      evolutions: evolutionsList?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pokemonIdentifier': pokemonIdentifier,
      'name': name,
      'types': types,
      'sprite': spriteUrl,
      'height': height,
      'weight': weight,
      'stats': stats,
      'evolutions': evolutions,
    };
  }
}
