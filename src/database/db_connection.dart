import 'package:postgres/postgres.dart';

import '../helpers/query_extensions.dart';
import '../tables/packages.dart';
import '../tables/packages_versions.dart';

class DBConnection {
  DBConnection({this.connection});

  final PostgreSQLConnection? connection;

  Future<void> closeDBConnection() async {
    await connection?.close();
  }

  Future<bool> addNewPackageToDB({
    required PackageVersion pv,
    required Packages p,
  }) async {
    await connection!.query(
      pv.insertQuery('packages_versions'),
      substitutionValues: pv.getQueryParamValues(),
    );
    await connection!.query(
      p.insertQuery('packages'),
      substitutionValues: p.getQueryParamValues(),
    );
    return true;
  }
}
