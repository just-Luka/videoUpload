class ValidationResponse {
  final bool isSuccess;
  final String? message;

  ValidationResponse({
    required this.isSuccess,
    this.message,
  });
}
