import 'dart:convert';

import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/home_repository.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeRepositoryImp implements HomeRepository {
  var url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    var client = http.Client();

    try {
      var response = await client.get(Uri.parse(url));

      var decoded = jsonDecode(response.body)['pokemon'] as List;

      return decoded.map((e) => PokemonModel.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    } finally {
      client.close();
    }
    return [];
  }
}
