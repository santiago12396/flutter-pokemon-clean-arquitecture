import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';

abstract class GetPokemonUseCase {
  Future<Pokemon> execute({required int id});
}

class GetPokemon implements GetPokemonUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemon({required PokemonRepository pokemonRepository})
    : _pokemonRepository = pokemonRepository;

  @override
  Future<Pokemon> execute({required int id}) async {
    return await _pokemonRepository.findOne(id: id);
  }
}
