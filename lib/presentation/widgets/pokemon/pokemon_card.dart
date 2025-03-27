import 'package:flutter/material.dart';
import 'package:pokemon/domain/entities/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text('${pokemon.id}'),
            Image.network(pokemon.image, height: 350, fit: BoxFit.cover),
            Text('${pokemon.name}'),
          ],
        ),
      ),
    );
  }
}
