import 'package:pokemon/domain/datasources/pokemon.datasource.dart';
import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon.repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _pokemonDatasource;

  PokemonRepositoryImpl({required PokemonDatasource pokemonDatasource})
    : _pokemonDatasource = pokemonDatasource;

  @override
  Future<List<Pokemon>> findAll() {
    return _pokemonDatasource.findAll();
  }
}
