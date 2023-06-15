class Pokemon {
  int id;
  String name;
  List<String> types;
  List<String> moves;
  Map<String, int> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.moves,
    required this.stats,
  });
}
