import 'package:flutter/material.dart';
import 'package:pokemon/infractucture/datasources/pokemon.datasource.impl.dart';
import 'package:pokemon/infractucture/repositories/pokemon.repository.impl.dart';
import 'package:pokemon/presentation/providers/pokemon_provider.dart';
import 'package:pokemon/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final PokemonRepositoryImpl _pokemonRepository;

  MyApp({super.key})
    : _pokemonRepository = PokemonRepositoryImpl(
        pokemonDatasource: PokemonDatasourceImpl(),
      );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create:
              (_) =>
                  PokemonProvider(pokemonRepository: _pokemonRepository)
                    ..fetchPokemons(),
        ),
      ],
      child: const MaterialApp(title: 'Pokemons', home: HomeScreen()),
    );
  }
}
