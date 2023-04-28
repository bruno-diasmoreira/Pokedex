import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/common/utils.dart';
import 'package:pokedex/models/pokemon_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    PokemonModel pokemon =
        ModalRoute.of(context)!.settings.arguments as PokemonModel;

    return Scaffold(
      backgroundColor: Utils.getColorByType(pokemon.types[0]),

      // appBar: AppBar(
      //   title: Text(pokemon.name),
      //   centerTitle: true,
      //   backgroundColor: Utils.getColorByType(pokemon.types[0]),
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Utils.getColorByType(pokemon.types[0])
      //   ),
        
      //   ),
    );
  }
}
