import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:postgres/postgres.dart';

import 'src/database/db_connection.dart';

final log = Logger('Dart Package Repo');

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  Logger.root.level = Level.ALL;

  // Logger.root.onRecord.listen((record) {
  //   print('${record.level.name}: ${record.time}: ${record.message}');
  // });

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

    log.info('database connected');
  }

  return serve(handler, ip, port);
}
