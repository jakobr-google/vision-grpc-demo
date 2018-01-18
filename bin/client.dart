// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:grpc/grpc.dart';

import 'package:visiondemo/src/generated/google/cloud/vision/v1/image_annotator.pbgrpc.dart';

main(List<String> args) async {
  ClientChannel channel;
  ImageAnnotatorClient stub;

  channel = new ClientChannel('vision.googleapis.com',
      options: const ChannelOptions.secure());
  stub = new ImageAnnotatorClient(channel);

  final apiKey = new File('api.key').readAsStringSync().trim();
  final authOption = new CallOptions(metadata: {'x-goog-api-key': apiKey});

  final imageSource = new ImageSource()
    ..gcsImageUri = "gs://gapic-toolkit/President_Barack_Obama.jpg";
  final image = new Image()..source = imageSource;
  final request = new AnnotateImageRequest()
    ..image = image
    ..features.add(new Feature()..type = Feature_Type.FACE_DETECTION);
  final requests = new BatchAnnotateImagesRequest()..requests.add(request);

  final responses =
      await stub.batchAnnotateImages(requests, options: authOption);
  for (final response in responses.responses) {
    print('$response');
  }

  await channel.shutdown();
}
