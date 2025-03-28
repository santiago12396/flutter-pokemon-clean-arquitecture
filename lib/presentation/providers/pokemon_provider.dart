import 'package:flutter/material.dart';
import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/use_cases/pokemons/pokemons.dart';

class PokemonProvider extends ChangeNotifier {
  final PokemonRepository _pokemonRepository;

  List<Pokemon> pokemons = [];

  PokemonProvider({required pokemonRepository})
    : _pokemonRepository = pokemonRepository;

  Future<void> fetchPokemons() async {
    pokemons =
        await GetPokemons(pokemonRepository: _pokemonRepository).execute();

    notifyListeners();
  }
}
