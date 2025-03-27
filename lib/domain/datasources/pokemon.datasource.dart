import 'package:pokemon/domain/entities/pokemon.dart';

abstract class PokemonDatasource {
  Future<List<Pokemon>> findAll();
}
