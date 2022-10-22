import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:get_it/get_it.dart';
import 'package:postgres/postgres.dart';

import 'src/database/db_connection.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  if (!GetIt.I.isRegistered<DBConnection>()) {
    GetIt.I.registerSingletonAsync<DBConnection>(() async {
      final connection = PostgreSQLConnection(
        'localhost',
        5432,
        'dart_package_manager_db',
        username: 'postgres',
        password: 'example',
      );

      await connection.open();

      return DBConnection(connection: connection);
    });

    await GetIt.I.allReady();

    print('database connected');
  }

  return serve(handler, ip, port);
}
