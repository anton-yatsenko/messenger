import 'dart:typed_data';

import 'package:domain/models/user/user_model.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/painting.dart';

import '../entities/user_entity.dart';

class UserMapper {
  final RemoteMediaRepository _remoteMediaRepository;

  UserMapper({required RemoteMediaRepository remoteMediaRepository})
      : _remoteMediaRepository = remoteMediaRepository;

  Map<String, dynamic> toJson(UserEntity userEntity) {
    return {
      'id': userEntity.id,
      'email': userEntity.email,
      'chats': userEntity.chats != null
          ? {
              for (var chat in userEntity.chats!) chat: true,
            }
          : null,
      'contacts': userEntity.contacts != null
          ? {
              for (var contact in userEntity.contacts!) contact: true,
            }
          : null,
      'name': userEntity.name,
      'surname': userEntity.surname,
      'dateOfBirth': userEntity.dateOfBirth?.toIso8601String(),
      'additionalInfo': userEntity.additionalInfo,
      'pathToProfilePicture': userEntity.pathToProfilePicture,
    };
  }

  UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      email: json['email'],
      chats:
          json['chats'] != null ? List<String>.from(json['chats'].keys) : null,
      contacts: json['contacts'] != null
          ? List<String>.from(json['contacts'].keys)
          : null,
      name: json['name'],
      surname: json['surname'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      additionalInfo: json['additionalInfo'],
      pathToProfilePicture: json['pathToProfilePicture'],
    );
  }

  Future<UserModel> entityToModel({
    required UserEntity userEntity,
  }) async {
    final path = userEntity.pathToProfilePicture;
    late final Uint8List? imageBytes;
    if (path != null) {
      imageBytes = await _remoteMediaRepository.getImageBytesByPath(path: path);
    } else {
      imageBytes = null;
    }

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
