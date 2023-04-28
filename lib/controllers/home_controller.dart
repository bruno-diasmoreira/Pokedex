import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;


  HomeController(this._homeRepository);

  ValueNotifier<List<PokemonModel>> pokemons = ValueNotifier<List<PokemonModel>>([]);
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);


  fetchPokemons() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1));
    pokemons.value = await _homeRepository.getAllPokemons();
    loading.value = false;
  }

}
