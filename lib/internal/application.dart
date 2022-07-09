import 'package:blindside_task/domain/cubit/comment_cubit.dart';
import 'package:blindside_task/presentation/pages/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color secondColor = Color.fromRGBO(246, 198, 152, 1);
    return BlocProvider(
      create: (context) => CommentCubit(),
      child: MaterialApp(
        home: const WrapperPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(45, 45, 45, 1),
        ),
      ),
    );
  }
}
