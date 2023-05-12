import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/component/component.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/cubitStates.dart';

class tassksDone extends StatelessWidget {
  const tassksDone({super.key});
  static const String id = 'klcxd';
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStats>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return cubit.doneTasks.isEmpty
            ? Center(
                child: Column(                  mainAxisAlignment: MainAxisAlignment.center,

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
                  return buildTaskItem(cubit.doneTasks[index], context);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: cubit.doneTasks.length);
      },
    );
    ;
  }
}
