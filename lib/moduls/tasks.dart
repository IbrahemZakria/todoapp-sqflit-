import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp2/shared/component/component.dart';
import 'package:todoapp2/shared/cubit/cubit.dart';
import 'package:todoapp2/shared/cubit/cubitStates.dart';

class tasks extends StatelessWidget {
  const tasks({super.key});
  static const String id = 'klcsd';
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStats>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return cubit.addTasks.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 50,
                      color: Colors.grey,
                    ),
                    Text('there is no tasks please enter some tasks')
                  ],
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return buildTaskItem(cubit.addTasks[index], context);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: cubit.addTasks.length);
      },
    );
  }
}
