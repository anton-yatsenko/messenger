import 'dart:typed_data';

abstract interface class DeviceMediaRepository {
  Future<Uint8List?> pickPhotoFromDevice();

  Future<Uint8List?> takePhoto();
}
