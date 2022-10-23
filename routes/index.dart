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
          log.severe("${request.url} isn't multipart");

          return Future<shelf.Response>.value(shelf.Response.badRequest());
        }

        await for (final part in request.parts) {
          final file = await part.readBytes();

          if (file.isEmpty) {
            log.warning('Missing file');

            return Future<shelf.Response>.value(
              shelf.Response.badRequest(body: 'Missing file'),
            );
          }

          try {
            File('./files/file.png').writeAsBytesSync(file);
          } on FileSystemException catch (e) {
            log.severe(e.message, e.osError);

            return Future<shelf.Response>.value(
              shelf.Response.internalServerError(body: e.message),
            );
          }
        }

        log.info('file uploaded');

        return Future<shelf.Response>.value(shelf.Response.ok('File uploaded'));
      },
    ),
  );

  return result.call(context);
}
