import 'package:blindside_task/domain/cubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddVideoButton extends StatelessWidget {
  const AddVideoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Colors.white,
      backgroundColor: const Color.fromRGBO(246, 198, 152, 1),
      onPressed: () async {
        await BlocProvider.of<VideoCubit>(context).uploadFile();
      },
      child: const Icon(
        Icons.add,
        color: Colors.black,
        size: 28,
      ),
    );
  }
}
