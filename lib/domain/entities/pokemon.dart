class Pokemon {
  final int id;
  final String name;
  final String image;
  final int height;
  final int weight;
  final List<PokemonStat> stats;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
  });
}

class PokemonStat {
  final String name;
  final int baseStat;

  PokemonStat({required this.name, required this.baseStat});
}
