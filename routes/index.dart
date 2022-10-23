import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_multipart/multipart.dart';

import '../main.dart';

Future<Response> onRequest(RequestContext context) async {
  final result = await Future.value(
    fromShelfHandler(
      (request) async {
        if (!request.isMultipart) {
          return Future<shelf.Response>.value(shelf.Response.badRequest());
        }

        await for (final part in request.parts) {
          final file = await part.readBytes();

          File('./files/file.png').writeAsBytesSync(file);
        }

        log.info('file uploaded');

        return Future<shelf.Response>.value(shelf.Response.ok('File uploaded'));
      },
    ),
  );

  return result.call(context);
}
