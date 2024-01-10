import 'dart:ui';

import 'package:core/constants/api_constants.dart';
import 'package:data/entities/user_entity.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _auth;
  final FirebaseDatabase _database;
  final FirebaseStorage _storage;
  final UserMapper _userMapper;

  UserRepositoryImpl(
      {required FirebaseAuth auth,
      required FirebaseDatabase database,
      required FirebaseStorage storage,
      required UserMapper userMapper})
      : _auth = auth,
        _database = database,
        _storage = storage,
        _userMapper = userMapper;

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    final userRef = _database.ref().child(ApiConstants.users);
    final userSnapshots = await userRef.get();
    final List<UserEntity> userEntities = [];
    for (final userSnapshot in userSnapshots.children) {
      final userJson = userSnapshot as Map<String, dynamic>;
      userEntities.add(_userMapper.fromJson(userJson));
    }
    final List<UserModel> userModels = [];
    for (final userEntity in userEntities) {
      userModels.add(await _userMapper.entityToModel(
        userEntity: userEntity,
      ));
    }
    return userModels;
  }

  @override
  Future<List<UserModel>> getContacts() {
    // TODO: implement getContacts
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUserInfo() {
    // TODO: implement getCurrentUserInfo
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
