import 'package:blindside_task/data/validation_response.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> withEmailAndPassword(String email, String password) async {
    final emailVal = _validateEmail(email);
    final passVal = _validatePassword(password);

    if (emailVal.isSuccess == false || passVal.isSuccess == false) {
      emit(ValidationError(
          emailMessage: emailVal.message, passwordMessage: passVal.message));
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then((value) => emit(LoggedIn()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          emit(LoginError(errorMessage: 'Login or Password is incorrect!'));
        }
      }
    }
  }

  ValidationResponse _validateEmail(String value) {
    if (value.isEmpty) {
      return ValidationResponse(
        isSuccess: false,
        message: "Email cannot be empty",
      );
    }
    if (!value.contains('@')) {
      return ValidationResponse(
        isSuccess: false,
        message: "Email is not correct",
      );
    }
    return ValidationResponse(isSuccess: true);
  }

  ValidationResponse _validatePassword(String value) {
    if (value.isEmpty) {
      return ValidationResponse(
        isSuccess: false,
        message: "Password cannot be empty",
      );
    }
    return ValidationResponse(isSuccess: true);
  }
}
