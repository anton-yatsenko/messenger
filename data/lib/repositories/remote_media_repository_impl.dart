import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:domain/domain.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:core/core.dart';
import 'package:flutter/painting.dart';

class RemoteMediaRepositoryImpl implements RemoteMediaRepository {
  final FirebaseStorage _storage;

  RemoteMediaRepositoryImpl({
    required FirebaseStorage storage,
  }) : _storage = storage;

  @override
  Future<Uint8List?> getImageBytesByPath({required String path}) async {
    final imageRef = _storage.ref(path);
    try {
      final imageBytes = await imageRef.getData(StorageConstants.oneMegabyte);
      return imageBytes;
    } on FirebaseException catch (e) {
      _cloudStorageExceptionHandler(e);
    }
    return null;
  }

  _cloudStorageExceptionHandler(FirebaseException e) {
    final String code = e.code;
    if (code == 'storage/unknown') {
      throw UnknownErrorException();
    } else if (code == 'storage/object-not-found' ||
        code == 'storage/bucket-not-found' ||
        code == 'storage/project-not-found' ||
        code == 'storage/quota-exceeded' ||
        code == 'storage/unauthorized' ||
        code == 'storage/invalid-event-name' ||
        code == 'storage/invalid-url' ||
        code == 'storage/invalid-url' ||
        code == 'storage/invalid-argument' ||
        code == 'storage/no-default-bucket') {
      throw InternalErrorException();
    } else if (code == 'storage/unauthenticated') {
      throw UnauthenticatedException();
    } else if (code == 'storage/retry-limit-exceeded') {
      throw SlowConnectionException();
    } else if (code == 'storage/invalid-checksum' ||
        code == 'storage/cannot-slice-blob' ||
        code == 'storage/server-file-wrong-size') {
      throw TryAgainException();
    } else if (code == 'storage/canceled') {
      throw UserCancelledOperationException();
    }
  }
}
