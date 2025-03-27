import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pokemon/domain/datasources/pokemon.datasource.dart';
import 'package:pokemon/domain/entities/pokemon.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  @override
  Future<List<Pokemon>> findAll() async {
    final String url = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=20';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(data);
      return data as List<Pokemon>;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
