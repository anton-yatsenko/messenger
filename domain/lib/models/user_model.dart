import 'package:flutter/material.dart';

@immutable
class UserModel {
  final String? name;
  final String? surname;
  final String email;
  final DateTime? dateOfBirth;
  final String? additionalInfo;

  const UserModel({
    required this.email,
    this.name,
    this.surname,
    this.dateOfBirth,
    this.additionalInfo,
  });
}
