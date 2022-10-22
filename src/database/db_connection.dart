import 'package:postgres/postgres.dart';

class DBConnection {
  DBConnection({this.connection});

  final PostgreSQLConnection? connection;

  Future<void> closeDBConnection() async {
    await connection?.close();
  }
}
