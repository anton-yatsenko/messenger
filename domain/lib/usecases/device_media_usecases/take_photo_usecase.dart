import 'dart:typed_data';

import 'package:domain/repositories/device_media_repository.dart';
import 'package:domain/usecases/usecase.dart';

class TakePhotoUseCase extends FutureUseCase<void, Uint8List?> {
  final DeviceMediaRepository _deviceMediaRepository;

  TakePhotoUseCase({required DeviceMediaRepository deviceMediaRepository})
      : _deviceMediaRepository = deviceMediaRepository;

  @override
  Future<Uint8List?> execute(void input) async {
    return await _deviceMediaRepository.takePhoto();
  }
}
