import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';

abstract class GetPokemonsUseCase {
  Future<List<Pokemon>> execute();
}

class GetPokemons implements GetPokemonsUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemons({required PokemonRepository pokemonRepository})
    : _pokemonRepository = pokemonRepository;

  @override
  Future<List<Pokemon>> execute() async {
    return await _pokemonRepository.findAll();
  }
}
