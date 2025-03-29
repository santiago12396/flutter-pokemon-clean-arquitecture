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

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: pokemonProvider.pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonProvider.pokemons[index];
          return PokemonCard(pokemon: pokemon);
        },
      ),
    );
  }
}
