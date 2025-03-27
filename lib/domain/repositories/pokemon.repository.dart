import 'package:pokemon/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> findAll();
}
