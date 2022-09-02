import 'package:routeur/sqlbase/services/services.dart';
import 'package:routeur/sqlbase/sql.dart';
import 'package:sqflite/sqflite.dart';

import 'model/routeur.dart';

class RouteurDAO {
  ConnectionSQLiteService _connection = ConnectionSQLiteService.instance;

  Future<Database> _getDatabase() async {
    return await _connection.db;
  }

  Future<Routeur> add(Routeur routeur) async {
    try {
      Database db = await _getDatabase();
      int id = await db.rawInsert(ConnectionSQL.adddata(routeur));
      routeur.id = id;
      return routeur;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> update(Routeur routeur) async {
    try {
      Database db = await _getDatabase();
      int linhasAfetadas =
      await db.rawUpdate(ConnectionSQL.updatedata(routeur));
      if (linhasAfetadas > 0) {
        return true;
      }
      return false;
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<Routeur>> selectrouteur() async {
    try {
      Database db = await _getDatabase();
      List<Map> linhas =
      await db.rawQuery(ConnectionSQL.selectdata());
      List<Routeur> routeur = Routeur.fromSQLiteList(linhas);
      return routeur;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> delete(Routeur routeur) async {
    try {
      Database db = await _getDatabase();
      int linhasAfetadas =
      await db.rawUpdate(ConnectionSQL.deletedata(routeur));
      if (linhasAfetadas > 0) {
        return true;
      }
      return false;
    } catch (error) {
      throw Exception();
    }
  }
}