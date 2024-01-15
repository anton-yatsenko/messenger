import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:core_ui/core_ui.dart';

class ProfilePicOrPlaceholder extends StatelessWidget {
  final Uint8List? _imageBytes;
  final double _radius;

  const ProfilePicOrPlaceholder({
    super.key,
    required Uint8List? imageBytes,
    required double radius,
  })  : _imageBytes = imageBytes,
        _radius = radius;

  @override
  Widget build(BuildContext context) {
    if (_imageBytes != null) {
      return Image.memory(_imageBytes);
    } else {
      const image = AssetImage(
        'lib/src/assets/profile_placeholder.png',
        package: 'core_ui',
      );
      return CircleAvatar(
        backgroundImage: image,
        radius: _radius,
      );
    }
  }
}
