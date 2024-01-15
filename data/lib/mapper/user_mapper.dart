import 'dart:typed_data';

import 'package:domain/models/user/user_model.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/painting.dart';

import '../entities/user_entity.dart';

sealed class UserMapper {
  static Map<String, dynamic> toJson(UserEntity userEntity) {
    return {
      'email': userEntity.email,
      'name': userEntity.name,
      'surname': userEntity.surname,
      'dateOfBirth': userEntity.dateOfBirth?.toIso8601String(),
      'additionalInfo': userEntity.additionalInfo,
      'pathToProfilePicture': userEntity.pathToProfilePicture,
    };
  }

  static UserEntity fromJson({
    required Map<String, dynamic> json,
    required String userId,
  }) {
    return UserEntity(
      id: userId,
      email: json['email'],
      name: json['name'],
      surname: json['surname'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      additionalInfo: json['additionalInfo'],
      pathToProfilePicture: json['pathToProfilePicture'],
    );
  }

  static UserModel entityToModel({
    required UserEntity userEntity,
    required Uint8List? imageBytes,
  }) {
    return UserModel(
      id: userEntity.id,
      email: userEntity.email,
      name: userEntity.name,
      surname: userEntity.surname,
      dateOfBirth: userEntity.dateOfBirth,
      additionalInfo: userEntity.additionalInfo,
      profilePictureBytes: imageBytes,
    );
  }
}
