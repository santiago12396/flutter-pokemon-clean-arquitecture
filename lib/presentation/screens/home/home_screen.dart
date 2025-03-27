import 'package:flutter/material.dart';
import 'package:pokemon/presentation/providers/pokemon_provider.dart';
import 'package:pokemon/presentation/widgets/pokemon/pokemon_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemons')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = context.watch<PokemonProvider>();

    return ListView.builder(
      itemCount: pokemonProvider.pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemonProvider.pokemons[index];
        return PokemonCard(pokemon: pokemon);
      },
    );
  }
}
