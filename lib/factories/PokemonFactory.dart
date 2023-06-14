import 'dart:math';

import '../models/Pokemon.dart';

class PokemonFactory {
  static Pokemon creerPokemon(String nom) {
    final random = Random();
    final pv = 200;
    final atk = random.nextInt(20) + 1;
    final atkSpe = random.nextInt(20) + 1;
    final def = random.nextInt(20) + 1;
    final defSpe = random.nextInt(20) + 1;
    final vit = random.nextInt(20) + 1;

    return Pokemon(
      nom: nom,
      pv: pv,
      atk: atk,
      atkSpe: atkSpe,
      def: def,
      defSpe: defSpe,
      vit: vit,
    );
  }
}
