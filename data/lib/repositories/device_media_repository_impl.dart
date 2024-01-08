import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:domain/repositories/device_media_repository.dart';
import 'package:image_picker/image_picker.dart';

class DeviceMediaRepositoryImpl implements DeviceMediaRepository {
  final ImagePicker _imagePicker;

  DeviceMediaRepositoryImpl({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  @override
  Future<Uint8List?> pickPhotoFromDevice() async {
    const source = ImageSource.gallery;
    if (_imagePicker.supportsImageSource(source)) {
      final photo = await _imagePicker.pickImage(source: source);
      return photo?.readAsBytes();
    } else {
      throw UnsupportedSourceException();
    }
  }

  @override
  Future<Uint8List?> takePhoto() async {
    const source = ImageSource.camera;
    if (_imagePicker.supportsImageSource(source)) {
      final photo = await _imagePicker.pickImage(source: source);
      return photo?.readAsBytes();
    } else {
      throw UnsupportedSourceException();
    }
  }
}
