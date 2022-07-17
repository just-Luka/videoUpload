import 'package:blindside_task/domain/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          autovalidateMode: AutovalidateMode.always,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Email',
            labelStyle: GoogleFonts.josefinSans(
              color: Colors.white,
            ),
            hintText: 'Enter your Email',
            hintStyle: GoogleFonts.josefinSans(color: Colors.white),
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(246, 198, 152, 1), width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is ValidationError) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  state.emailMessage == null ? '' : state.emailMessage!,
                  style: GoogleFonts.josefinSans(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _passController,
          obscureText: true,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Password',
            labelStyle: GoogleFonts.josefinSans(
              color: Colors.white,
            ),
            hintText: 'Enter your password',
            hintStyle: GoogleFonts.josefinSans(color: Colors.white),
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(246, 198, 152, 1), width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is ValidationError) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  state.passwordMessage == null ? '' : state.passwordMessage!,
                  style: GoogleFonts.josefinSans(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            } else if (state is LoginError) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  state.errorMessage,
                  style: GoogleFonts.josefinSans(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
        const SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 45.0,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(45, 45, 45, 1),
                  Color.fromRGBO(246, 198, 152, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).withEmailAndPassword(
                    _emailController.text, _passController.text);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Login ➞',
                style: GoogleFonts.josefinSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
