import 'package:flutter/material.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/use_cases/pokemons/get_pokemons_use_case.dart';
import 'package:pokemon/infractucture/datasources/pokemon_datasource.dart';

import 'package:pokemon/infractucture/repositories/pokemon_repository_impl.dart';

import 'package:pokemon/presentation/providers/pokemon_provider.dart';
import 'package:pokemon/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  final PokemonDatasource pokemonDatasource = PokemonDatasourceImpl();
  final PokemonRepository pokemonRepository = PokemonRepositoryImpl(
    pokemonDatasource: pokemonDatasource,
  );
  final GetPokemonsUseCase getPokemonUseCase = GetPokemonsUseCase(
    pokemonRepository: pokemonRepository,
  );

  runApp(MyApp(getPokemonsUseCase: getPokemonUseCase));
}

class MyApp extends StatelessWidget {
  final GetPokemonsUseCase getPokemonsUseCase;

  const MyApp({super.key, required this.getPokemonsUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => PokemonProvider(getPokemonsUseCase: getPokemonsUseCase),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Pokemons',
        home: const HomeScreen(),
      ),
    );
  }
}
