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
    await connection!.query(pv.insertQuery());
    await connection!.query(p.insertQuery());
    return true;
  }
}


// final result = await GetIt.I<DBConnection>().addNewPackageToDB(
//           pv: PackageVersion(
//             archiveUrl: 'archive url test',
//             packageId: 'ba765dcb-c4bc-42ee-826d-01849c517742',
//             pubspec: '{"testKey": "testValues"}',
//             retracted: false,
//             version: '1.0.0',
//           ),
//           p: Packages(
//             name: 'name',
//             latestVersion: 'latestV',
//             packageId: 'ba765dcb-c4bc-42ee-826d-01849c517742',
//           ),
//         );

//         print('$result');
