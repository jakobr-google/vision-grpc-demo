///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library google.cloud.vision.v1_image_annotator_pbgrpc;

import 'dart:async';

import 'package:grpc/grpc.dart';

import 'image_annotator.pb.dart';
export 'image_annotator.pb.dart';

class ImageAnnotatorClient extends Client {
  static final _$batchAnnotateImages =
      new ClientMethod<BatchAnnotateImagesRequest, BatchAnnotateImagesResponse>(
          '/google.cloud.vision.v1.ImageAnnotator/BatchAnnotateImages',
          (BatchAnnotateImagesRequest value) => value.writeToBuffer(),
          (List<int> value) =>
              new BatchAnnotateImagesResponse.fromBuffer(value));

  ImageAnnotatorClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseFuture<BatchAnnotateImagesResponse> batchAnnotateImages(
      BatchAnnotateImagesRequest request,
      {CallOptions options}) {
    final call = $createCall(
        _$batchAnnotateImages, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }
}

abstract class ImageAnnotatorServiceBase extends Service {
  String get $name => 'google.cloud.vision.v1.ImageAnnotator';

  ImageAnnotatorServiceBase() {
    $addMethod(new ServiceMethod(
        'BatchAnnotateImages',
        batchAnnotateImages_Pre,
        false,
        false,
        (List<int> value) => new BatchAnnotateImagesRequest.fromBuffer(value),
        (BatchAnnotateImagesResponse value) => value.writeToBuffer()));
  }

  Future<BatchAnnotateImagesResponse> batchAnnotateImages_Pre(
      ServiceCall call, Future<BatchAnnotateImagesRequest> request) async {
    return batchAnnotateImages(call, await request);
  }

  Future<BatchAnnotateImagesResponse> batchAnnotateImages(
      ServiceCall call, BatchAnnotateImagesRequest request);
}
