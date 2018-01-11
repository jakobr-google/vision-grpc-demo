#!/usr/bin/env bash

if [ ! -d "$PROTOBUF" ]; then
  echo "PROTOBUF environment variable not set, defaulting to /usr/include."
  PROTOBUF_SRC=/usr/include
else
  PROTOBUF_SRC=$PROTOBUF
fi

if [ ! -d "$GOOGLEAPIS" ]; then
  echo "Please set the GOOGLEAPIS environment variable to your clone of googleapis/googleapis."
  exit -1
fi

PROTOC="protoc --dart_out=grpc:lib/src/generated -I$PROTOBUF_SRC -I$GOOGLEAPIS"

$PROTOC $GOOGLEAPIS/google/cloud/vision/v1/geometry.proto
$PROTOC $GOOGLEAPIS/google/cloud/vision/v1/image_annotator.proto
$PROTOC $GOOGLEAPIS/google/cloud/vision/v1/text_annotation.proto
$PROTOC $GOOGLEAPIS/google/cloud/vision/v1/web_detection.proto

$PROTOC $GOOGLEAPIS/google/rpc/status.proto
$PROTOC $GOOGLEAPIS/google/type/latlng.proto
$PROTOC $GOOGLEAPIS/google/type/color.proto

$PROTOC $PROTOBUF_SRC/google/protobuf/any.proto
$PROTOC $PROTOBUF_SRC/google/protobuf/wrappers.proto

dartfmt -w lib/src/generated
