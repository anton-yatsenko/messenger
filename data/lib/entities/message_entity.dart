class MessageEntity {
  final String userId;
  final String message;
  final List<String>? photosPathInCloud;

  MessageEntity({
    required this.userId,
    required this.message,
    required this.photosPathInCloud,
  });
}
