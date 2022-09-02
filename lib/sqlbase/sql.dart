import 'package:routeur/sqlbase/model/routeur.dart';

class ConnectionSQL{
  static final  CREATE_DATABASE='''
  CREATE TABLE 'data' (
    'id' INTEGRER PRIMARY KEY AUTOINCREMENT,
    'Direction' INTEGER,
    'Fournisseur' INTEGER,
  );
  ''';

  static String selectdata() {
    return 'select * from data;';
  }

  static String adddata(Routeur routeur ) {
     return '''
      insert into data(Direction, Fournisseur)
      values('${routeur.Direction}','${routeur.Fournisseur}');
     ''';
  }

  static String updatedata(Routeur routeur) {
    return '''
    update data
    set Direction = ${routeur.Direction},
    routeur = ''
    where id = ${routeur.id};
    ''';
  }

  static String deletedata(Routeur routeur) {
    return 'delete from contatos where id =${routeur.id};';
  }


}