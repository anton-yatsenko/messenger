import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UserModel extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? surname;
  final DateTime? dateOfBirth;
  final String? additionalInfo;
  final Uint8List? profilePictureBytes;

  const UserModel({
    required this.id,
    required this.email,
    this.name,
    this.surname,
    this.dateOfBirth,
    this.additionalInfo,
    this.profilePictureBytes,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        surname,
        dateOfBirth,
        additionalInfo,
        profilePictureBytes,
      ];
}
