import 'package:flutter/material.dart';
import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/use_cases/pokemons/pokemons.dart';

class PokemonProvider extends ChangeNotifier {
  final GetPokemonsUseCase _getPokemonsUseCase;

  List<Pokemon> pokemons = [];

  PokemonProvider({required GetPokemonsUseCase getPokemonsUseCase})
    : _getPokemonsUseCase = getPokemonsUseCase {
    fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    pokemons = await _getPokemonsUseCase.execute();
    notifyListeners();
  }
}
