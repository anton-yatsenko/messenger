import 'dart:typed_data';

abstract interface class RemoteMediaProvider {
  Future<Uint8List?> getImageBytesByPath({required String path});
}
