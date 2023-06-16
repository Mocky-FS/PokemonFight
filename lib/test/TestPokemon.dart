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
      final value = statData['base_stat'] as int;
      stats[name] = value;
    }
    final moves = [
      for (final moveData in pokemonData['moves'])
        _capitalizeFirstLetter(moveData['move']['name'].toString())
    ];

    // Définir la fonction `compareMoves` et `getMoveDetails`
    List<dynamic> getMoveDetails(String move, List<dynamic> moves) {
      return moves
          .where((moveData) => moveData['move']['name'] == move)
          .map((moveData) => moveData['version_group_details'])
          .toList();
    }

    int compareMoves(String a, String b, List<dynamic> moves) {
      final aDetails = getMoveDetails(a, moves);
      final bDetails = getMoveDetails(b, moves);

      final aLevel =
          aDetails.isNotEmpty ? aDetails[0]['level_learned_at'] as int : 0;
      final bLevel =
          bDetails.isNotEmpty ? bDetails[0]['level_learned_at'] as int : 0;

      return aLevel - bLevel;
    }

    // Trier les attaques du Pokemon par ordre croissant de niveau d'apprentissage
    moves.sort((a, b) => compareMoves(a, b, pokemonData['moves']));

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
      final details = getMoveDetails(move, pokemonData['moves']);
      final level =
          details.isNotEmpty ? details[0][0]['level_learned_at'] as int : 0;
      buffer.writeln('- ${move} (Level: ${level})');
    }
    return buffer.toString();
  } else {
    throw Exception('Failed to get pokemon info.');
  }
}

String _capitalizeFirstLetter(String input) {
  return "${input[0].toUpperCase()}${input.substring(1)}";
}
