import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/infractucture/datasources/pokemon_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _pokemonDatasource;

  PokemonRepositoryImpl({required PokemonDatasource pokemonDatasource})
    : _pokemonDatasource = pokemonDatasource;

  @override
  Future<List<Pokemon>> findAll() {
    return _pokemonDatasource.findAll();
  }

  @override
  Future<Pokemon> findOne({required int id}) {
    return _pokemonDatasource.findOne(id: id);
  }
}
