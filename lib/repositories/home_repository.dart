import 'package:pokedex/models/pokemon_model.dart';

abstract class HomeRepository {
  Future<List<PokemonModel>> getAllPokemons();
}
