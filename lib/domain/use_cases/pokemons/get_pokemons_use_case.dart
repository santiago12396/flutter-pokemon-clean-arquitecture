import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonsUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemonsUseCase({required PokemonRepository pokemonRepository})
    : _pokemonRepository = pokemonRepository;

  Future<List<Pokemon>> execute() async {
    return await _pokemonRepository.findAll();
  }
}
