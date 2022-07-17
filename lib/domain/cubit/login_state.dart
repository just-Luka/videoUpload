part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoggedIn extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;
  LoginError({
    required this.errorMessage,
  });
}

class ValidationError extends LoginState {
  final String? emailMessage;
  final String? passwordMessage;

  ValidationError({
    required this.emailMessage,
    required this.passwordMessage,
  });
}
