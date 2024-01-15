import 'dart:ui';
import 'package:flutter/material.dart';

final appAssets = AppAssets();

class AppAssets {
  static const _basePath = 'src/assets/';
  static const _packageName = 'core_ui';

  static const _profilePlaceholder = 'profile_placeholder.png';

  static const _russianFlagGif = 'russian_flag.gif';
  static const _englishFlagGif = 'english_flag.gif';
  static const _googleLogo = 'google_logo.png';

  static String get coreUiPackageName => _packageName;

  static String get profilePlaceholder => '$_basePath$_profilePlaceholder';

  static String get russianFlagGif => '$_basePath$_russianFlagGif';

  static String get englishFlagGif => '$_basePath$_englishFlagGif';

  static String get googleLogo => '$_basePath$_googleLogo';

//
// get russianFlag => Image.asset('lib/src/assets/russianFlag');
}
