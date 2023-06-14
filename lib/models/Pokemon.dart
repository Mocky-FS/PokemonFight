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