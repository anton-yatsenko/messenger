enum CloudStorageErrorCodes {
  unknown(code: 'unknown'),
  objectNotFound(code: 'object-not-found');

  const CloudStorageErrorCodes({
    required this.code,
  });

  final String code;
}
