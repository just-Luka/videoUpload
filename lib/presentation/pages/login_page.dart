import 'package:blindside_task/presentation/forms/login_form.dart';
import 'package:blindside_task/presentation/frames/center_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CenterFrame(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Text(
                  'Login',
                  style: GoogleFonts.josefinSans(
                    fontSize: 30,
                    color: const Color.fromRGBO(246, 198, 152, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Please sign in to continue',
                  style: GoogleFonts.josefinSans(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: LoginForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
