import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../src/helpers/multipart.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  if (!request.isMultipart) {
    return Response(statusCode: 401);
  }

  await for (final part in request.parts) {
    final file = await part.readBytes();

    File('./files/file.png').writeAsBytesSync(file);
  }

  return Response(body: 'File uploaded');
}
