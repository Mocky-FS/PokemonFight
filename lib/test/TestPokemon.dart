// Ce code a pour but de tester l'API plus profondemment en récupérant sur le terminal, les infos du pokémon.
// Nous devons insérer l'ID du pokémon et ça nous retourne son ID, son nom, son ou ses types, ses moves et ses stats.

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  // Demander à l'utilisateur l'ID du Pokémon
  final pokemonId = '1';

  final pokemonInfo = await getPokemonInfo(pokemonId);

  // Afficher la fiche du Pokémon
  print(pokemonInfo);
}

Future<String> getPokemonInfo(String pokemonId) async {
  final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final pokemonData = jsonDecode(response.body);

    // Récupérer les informations nécessaires
    final name = pokemonData['name'];
    final types = [
      for (final type in pokemonData['types'])
        _capitalizeFirstLetter(type['type']['name'].toString())
    ];
    final stats = <String, int>{};
    for (final statData in pokemonData['stats']) {
      final name = _capitalizeFirstLetter(statData['stat']['name'].toString());
      //final name = statData['stats']['name'].toString().capitalize();
      final value = statData['base_stat'] as int;
      stats[name] = value;
    }
    final moves = [
      for (final moveData in pokemonData['moves'])
        _capitalizeFirstLetter(moveData['move']['name'].toString())
    ];
    moves.sort((a, b) {
      // trier par ordre croissant (level) , les attaques du pokémon.
      final aDetails = pokemonData['moves']
          .where((move) => move['move']['name'] == a)
          .map((move) => move['version_group_details'])
          .toList();
      final bDetails = pokemonData['moves']
          .where((move) => move['move']['name'] == b)
          .map((move) => move['version_group_details'])
          .toList();

      final aLevel =
          aDetails.isNotEmpty ? aDetails[0][0]['level_learned_at'] as int : 0;
      final bLevel =
          bDetails.isNotEmpty ? bDetails[0][0]['level_learned_at'] as int : 0;
      return aLevel - bLevel;
    });

    // Créer la fiche Pokémon
    final buffer = StringBuffer()
      ..writeln('ID: $pokemonId')
      ..writeln('Name: ${_capitalizeFirstLetter(name)}')
      ..writeln('Types: ${types.join(", ")}')
      ..writeln('Stats:');
    for (final stat in stats.entries) {
      buffer.writeln('- ${stat.key}: ${stat.value}');
    }
    buffer.writeln('Moves:');
    for (final move in moves) {
      buffer.writeln('- $move');
    }
    return buffer.toString();
  } else {
    throw Exception('Failed to get pokemon info.');
  }
}

String _capitalizeFirstLetter(String input) {
  return "${input[0].toUpperCase()}${input.substring(1)}";
}
