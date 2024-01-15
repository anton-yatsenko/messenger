import 'dart:typed_data';

import 'package:data/entities/user_entity.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:domain/domain.dart';

import '../providers/interface/remote_media_provider.dart';
import '../providers/interface/user_provider.dart';

class UserRepositoryImpl implements UserRepository {
  final UserProvider _userProvider;
  final RemoteMediaProvider _remoteMediaProvider;

  UserRepositoryImpl(
      {required RemoteMediaProvider remoteMediaProvider,
      required UserProvider userProvider})
      : _userProvider = userProvider,
        _remoteMediaProvider = remoteMediaProvider;

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    final userEntities = await _userProvider.getAllUsers();
    return await _userEntitiesToModels(userEntities: userEntities);
  }

  @override
  Future<List<UserModel>> getContacts() async {
    final userEntities = await _userProvider.getContacts();
    return await _userEntitiesToModels(userEntities: userEntities);
  }

  @override
  Future<UserModel> getCurrentUserInfo() {
    // TODO: implement getCurrentUserInfo
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await _userProvider.signOut();
  }

  Future<List<UserModel>> _userEntitiesToModels({
    required List<UserEntity> userEntities,
  }) async {
    final List<UserModel> userModels = [];
    for (final userEntity in userEntities) {
      final pathToProfilePicture = userEntity.pathToProfilePicture;
      late final Uint8List? imageBytes;
      if (pathToProfilePicture != null) {
        imageBytes = await _remoteMediaProvider.getImageBytesByPath(
          path: pathToProfilePicture,
        );
      } else {
        imageBytes = null;
      }
      final userModel = UserMapper.entityToModel(
          userEntity: userEntity, imageBytes: imageBytes);
      userModels.add(userModel);
    }
    return userModels;
  }

  @override
  Future<List<UserModel>> addContacts({
    required List<String> allContactIds,
  }) async {
    await _userProvider.addContacts(allContactIds: allContactIds);
    return await getContacts();
  }
}
