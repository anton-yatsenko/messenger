class UserEntity {
  final String id;
  final String email;

  final String? name;
  final String? surname;
  final DateTime? dateOfBirth;
  final String? additionalInfo;
  final String? pathToProfilePicture;

  UserEntity({
    required this.id,
    required this.email,
    this.name,
    this.surname,
    this.dateOfBirth,
    this.additionalInfo,
    this.pathToProfilePicture,
  });
}
