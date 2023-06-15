import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Pokemon.dart';

class PokemonFactory {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<Pokemon> getPokemon(int id) async {
    final response = await http.get(Uri.parse('$baseUrl$id'));
    final data = json.decode(response.body);

    var types = <String>[];
    var moves = <String>[];
    var stats = <String, int>{};

    data['types'].forEach((type) {
      types.add(type['type']['name']);
    });

    data['moves'].forEach((move) {
      moves.add(move['move']['name']);
    });

    data['stats'].forEach((stat) {
      stats[stat['stat']['name']] = stat['baseStat'];
    });

    return Pokemon(
      id: data['id'],
      name: data['name'],
      types: types,
      moves: moves,
      stats: stats,
    );
  }
}
