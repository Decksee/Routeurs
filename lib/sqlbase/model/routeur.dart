class Routeur {
  int? id;
  String Direction;
  String Fournisseur;

  Routeur({
    this.id,
    required this.Direction,
    required this.Fournisseur,
  });

  factory Routeur.fromSQLite(Map map) {
    return Routeur(
      id: map['id'],
      Direction: map[' Direction'],
      Fournisseur: map['Fournisseur'],
    );
  }

  static List<Routeur> fromSQLiteList(List<Map> listMap) {
    List<Routeur> routeurs = [];
    for (Map item in listMap) {
      routeurs.add(Routeur.fromSQLite(item));
    }
    return routeurs;
  }

  factory Routeur.empty() {
    return Routeur(Direction: '', Fournisseur: '');
  }
}