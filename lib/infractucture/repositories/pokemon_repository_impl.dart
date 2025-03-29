import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/infractucture/datasources/pokemon_datasource.dart';
import 'package:pokemon/infractucture/mappers/pokemon_mapper.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _pokemonDatasource;

  PokemonRepositoryImpl({required PokemonDatasource pokemonDatasource})
    : _pokemonDatasource = pokemonDatasource;

  @override
  Future<List<Pokemon>> findAll() async {
    final pokemonsDTO = await _pokemonDatasource.findAll();
    return pokemonsDTO.map<Pokemon>(PokemonMapper.toEntity).toList();
  }

  @override
  Future<Pokemon> findOne({required int id}) async {
    final pokemonDTO = await _pokemonDatasource.findOne(id: id);
    return PokemonMapper.toEntity(pokemonDTO);
  }
}
