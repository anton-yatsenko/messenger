import 'dart:typed_data';
import 'dart:ui';

abstract interface class RemoteMediaRepository {
  Future<Uint8List?> getImageBytesByPath({required String path});
}
