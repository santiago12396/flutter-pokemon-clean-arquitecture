import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pokemon/infractucture/models/pokemon/pokemon_model.dart';
import 'package:pokemon/infractucture/models/pokemon/pokemon_response_model.dart';

abstract class PokemonDatasource {
  Future<List<PokemonDTO>> findAll();
  Future<PokemonDTO> findOne({required int id});
}

class PokemonDatasourceImpl implements PokemonDatasource {
  @override
  Future<List<PokemonDTO>> findAll() async {
    final String url = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=20';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body) as Map<String, dynamic>;

      final readPokemonDTO = ReadPokemonDTO.fromJson(data);

      final pokemonFutures = readPokemonDTO.results.map((result) async {
        final pokemonId = int.parse(result.url.split('/')[6]);
        return await findOne(id: pokemonId);
      });

      return await Future.wait(pokemonFutures);
    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  @override
  Future<PokemonDTO> findOne({required int id}) async {
    final String url = 'https://pokeapi.co/api/v2/pokemon/$id';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return PokemonDTO.fromJson(data);
    } else {
      throw Exception('Failed to load a pokemon');
    }
  }
}
