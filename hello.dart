import 'dart:io';
import 'dart:math';

class Pokemon {
  final String nom;
  int pv;
  final int atk;
  final int atkSpe;
  final int def;
  final int defSpe;
  final int vit;

  Pokemon({
    required this.nom,
    required this.pv,
    required this.atk,
    required this.atkSpe,
    required this.def,
    required this.defSpe,
    required this.vit,
  });

  // Afficher les infos du Pokémon
  void afficherInfos() {
    print('Nom: $nom');
    print('PV: $pv');
    print('Attaque: $atk');
    print('Attaque Spéciale: $atkSpe');
    print('Défense: $def');
    print('Défense Spéciale: $defSpe');
    print('Vitesse: $vit');
  }

  int attaquePhysique() {
    int degats = (20 + atk) - def;
    if (def > atk) {
      degats = 1;
    }
    return degats;
  }

  int attaqueSpeciale() {
    int degats = (20 + atkSpe) - defSpe;
    if (defSpe > atkSpe) {
      degats = 1;
    }
    return degats;
  }
}

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

void main() {
  Pokemon monPokemon = PokemonFactory.creerPokemon("Magikarp");
  Pokemon ennemiPokemon = PokemonFactory.creerPokemon("Dracaufeu");

  while (monPokemon.pv > 0 && ennemiPokemon.pv > 0) {
    // Tour du joueur
    print("Que faire?...");
    print("1. Attaque Physique");
    print("2. Attaque Spéciale");
    print("Choississez votre action (1-2): ");
    var choice = int.parse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        int degats = monPokemon.attaquePhysique();
        ennemiPokemon.pv -= degats;
        print(
            '${monPokemon.nom} inflige $degats points de dégâts à ${ennemiPokemon.nom} adverse !');
        print('${ennemiPokemon.nom} ennemi a ${ennemiPokemon.pv} HP restant.');
        break;

      case 2:
        int degats = monPokemon.attaqueSpeciale();
        ennemiPokemon.pv -= degats;
        print(
            '${monPokemon.nom} inflige $degats points de dégâts à ${ennemiPokemon.nom} adverse !');
        print('${ennemiPokemon.nom} ennemi a ${ennemiPokemon.pv} HP restant.');
        break;

      default:
        print('Choix invalide !');
    }

    if (ennemiPokemon.pv <= 0) {
      print('Vous avez vaincu ${ennemiPokemon.nom} ennemi !');
    } else {
      print('Vous n\'avez plus de pokémon valide. Vous perdez');
      break;
    }

    // Pause de 2 secondes
    Future.delayed(Duration(seconds: 2));

    // Tour de l'ennemi
    print('C\est au tour de ${ennemiPokemon.nom} ennemi.');
    int degatsEnnemi = ennemiPokemon.atk > ennemiPokemon.atkSpe
        ? ennemiPokemon.attaquePhysique()
        : ennemiPokemon.attaqueSpeciale();
    monPokemon.pv -= degatsEnnemi;
    print(
        '${ennemiPokemon.nom} inflige $degatsEnnemi points de dégâts à ${monPokemon.nom} ! ');
    print('Il vous reste ${monPokemon.pv} HP restant.');
  }
}
