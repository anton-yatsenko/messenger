import 'dart:convert';

import 'package:core/constants/api_constants.dart';
import 'package:data/entities/user_entity.dart';
import 'package:data/providers/interface/user_provider.dart';
import 'package:data/providers/database_references.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../mapper/user_mapper.dart';

class UserProviderImpl implements UserProvider {
  final FirebaseAuth _auth;
  final FirebaseDatabase _database;
  final FirebaseStorage _storage;
  final DatabaseReferences _references;
  late final DatabaseReference _userRef;

  UserProviderImpl({
    required FirebaseAuth auth,
    required FirebaseDatabase database,
    required FirebaseStorage storage,
    required DatabaseReferences references,
  })  : _auth = auth,
        _database = database,
        _storage = storage,
        _references = references,
        _userRef = database.ref().child(ApiConstants.users);

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final usersFromDatabase = await _references.getUsersRef().get();
    final userEntities =
        _dataSnapshotsToEntities(dataSnapshots: usersFromDatabase.children);
    return userEntities;
  }

  @override
  Future<List<UserEntity>> getUsersById({required List<String> userIds}) async {
    final List<DataSnapshot> userSnapshots = [
      for (final userId in userIds)
        await _references.getCurrentUserRef(userId: userId).get(),
    ];
    final userEntities = _dataSnapshotsToEntities(
      dataSnapshots: userSnapshots,
    );
    return userEntities;
  }

  @override
  Future<List<UserEntity>> getContacts() async {
    final currentUserContactRef = _getCurrentUserContactRef();
    if (currentUserContactRef != null) {
      final contactIdsSnapshotsFromDatabase = await currentUserContactRef.get();
      final List<String> contactIds = [
        for (final contactIdSnapshot
            in contactIdsSnapshotsFromDatabase.children)
          contactIdSnapshot.value as String,
      ];
      final contactEntities = await getUsersById(userIds: contactIds);
      return contactEntities;
    } else {
      throw UnauthenticatedException();
    }
  }

  @override
  Future<List<UserEntity>> addContacts(
      {required List<String> allContactIds}) async {
    final currentUserContactRef = _getCurrentUserContactRef();
    if (currentUserContactRef != null) {
      final List<MapEntry<String, dynamic>> contactEntriesList = [];
      for (final contactId in allContactIds) {
        contactEntriesList.add(MapEntry(contactId, true));
      }
      final Map<String, dynamic> contactMap =
          Map.fromEntries(contactEntriesList);
      await currentUserContactRef.update(contactMap);
      return await getContacts();
    } else {
      throw UnauthenticatedException();
    }
  }

  List<UserEntity> _dataSnapshotsToEntities({
    required Iterable<DataSnapshot> dataSnapshots,
  }) {
    final List<UserEntity> userEntities = [];
    for (final user in dataSnapshots) {
      debugPrint(user.value.toString());
      final userMap = user.value as Map<Object?, Object?>;
      final userJson = userMap.cast<String, dynamic>();
      final userId = user.key;
      if (userId != null) {
        userEntities.add(UserMapper.fromJson(
          json: userJson,
          userId: userId,
        ));
      }
    }
    return userEntities;
  }

  DatabaseReference? _getCurrentUserContactRef() {
    final currentUserId = _auth.currentUser?.uid;
    if (currentUserId != null) {
      final contactsRef = _references.getCurrentUserContactRef(
        userId: currentUserId,
      );
      return contactsRef;
    } else {
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
