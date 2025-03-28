import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/infractucture/models/pokemon/pokemon_model.dart';

class PokemonMapper {
  static Pokemon toEntity(PokemonDTO pokemonDTO) => Pokemon(
    id: pokemonDTO.id,
    name: pokemonDTO.name,
    image: pokemonDTO.sprites.frontDefault,
    height: pokemonDTO.height,
    weight: pokemonDTO.weight,
    stats:
        pokemonDTO.stats
            .map(
              (stat) =>
                  PokemonStat(name: stat.stat.name, baseStat: stat.baseStat),
            )
            .toList(),
    types:
        pokemonDTO.types
            .map((type) => PokemonTypes(name: type.type.name))
            .toList(),
  );
}
