class PokemonModel {
  final int id;
  final String name;
  final String imgUrl;
  List<String> types = [];

  PokemonModel(this.id, this.name, this.imgUrl,this.types);

  // factory PokemonModel.fromJson(Map json) {
  //   return PokemonModel(json['id'], json['name'], json['img'],json['type']);
  // }

  factory PokemonModel.fromJson(Map json) {
    var list = json['type'];
    List<String> newList = new List<String>.from(list);

    return PokemonModel(
      json['id'], 
      json['name'],
      json['img'],
      newList
      );
  }
}
