import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:get_it/get_it.dart';

import '../src/database/db_connection.dart';
import '../src/helpers/multipart.dart';
import '../src/tables/packages.dart';
import '../src/tables/packages_versions.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  if (!request.isMultipart) {
    return Response(statusCode: 401);
  }

  await for (final part in request.parts) {
    final file = await part.readBytes();

    File('./files/file.png').writeAsBytesSync(file);
  }

  final result = await GetIt.I<DBConnection>().addNewPackageToDB(
    pv: PackageVersion(
      archiveUrl: 'archive url test',
      packageId: 'ba765dcb-c4bc-42ee-826d-01849c517742',
      pubspec: '{"testKey": "testValues"}',
      retracted: false,
      version: '1.0.0',
    ),
    p: Packages(
      name: 'name',
      latestVersion: 'latestV',
      packageId: 'ba765dcb-c4bc-42ee-826d-01849c517742',
    ),
  );

  print('$result');

  return Response(body: 'File uploaded');
}
