import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp2/moduls/archeveScreen.dart';
import 'package:todoapp2/shared/component/component.dart';
import 'package:todoapp2/shared/component/textFormField.dart';
import 'package:todoapp2/shared/cubit/cubit.dart';
import 'package:todoapp2/shared/cubit/cubitStates.dart';

import '../moduls/tasks.dart';
import '../moduls/tassksDone.dart';

class homePade extends StatelessWidget {
  homePade({super.key});
  static const String id = 'home';

  var formKey = GlobalKey<FormState>();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var timeControler = TextEditingController();

  var dateControler = TextEditingController();

  var titleControler = TextEditingController();

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   createDataBase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit, AppStats>(
        listener: (context, AppStats state) {
          if (AppStats == appinsertdatabaseState) {
            Navigator.pop(context); 
          }
        },
        builder: (context, AppStats state) {
          AppCubit cubit = AppCubit.get(context);
          return Form(
            key: formKey,
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('todo'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (cubit.isBotonShown) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertToDataase(
                          title: titleControler.text,
                          date: dateControler.text,
                          time: timeControler.text);
                      // insertToDataase(titleControler.text, dateControler.text,
                      //     timeControler.text);
                      Navigator.pop(context);

                      cubit.isBotonShown = false;
                      // setState(() {
                      //   floatIcon = Icon(Icons.edit);
                      // });
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet((context) {
                          return Container(
                              color: Colors.grey[100],
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultTextFormField(
                                      textControler: titleControler,
                                      hintText: 'title',
                                      validator: (p0) {
                                        if (p0 == null || p0.isEmpty) {
                                          return 'please enter the title';
                                        }
                                      },
                                      sufixIcon: Icon(Icons.title)),
                                  defaultTextFormField(
                                    textControler: dateControler,
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.now()
                                                  .add(Duration(days: 44444)))
                                          .then((value) {
                                        dateControler.text =
                                            DateFormat.yMMMEd().format(value!);
                                      });
                                    },
                                    textinputType: TextInputType.datetime,
                                    hintText: 'task time',
                                    validator: (p0) {
                                      if (p0 == null || p0.isEmpty) {
                                        return 'please enter the time';
                                      }
                                    },
                                    sufixIcon: Icon(Icons.timer_outlined),
                                  ),
                                  defaultTextFormField(
                                      textControler: timeControler,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          timeControler.text =
                                              value!.format(context);
                                        });
                                      },
                                      hintText: 'date',
                                      validator: (p0) {
                                        if (p0 == null || p0.isEmpty) {
                                          return 'please enter the date';
                                        }
                                      },
                                      sufixIcon: Icon(Icons.date_range)),
                                ],
                              ));
                        })
                        .closed
                        .then((value) {
                          cubit.changebottomShet(
                              isshow: false, icon: Icon(Icons.edit));
                        });
                    cubit.changebottomShet(isshow: true, icon: Icon(Icons.add));
                  }
                },
                tooltip: 'Increment',
                child: cubit.floatIcon,
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'tassks'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.done), label: 'done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive_outlined), label: 'archive'),
                ],
                onTap: (value) {
                  cubit.changeIndex(value);
                  // setState(() {});
                },
                currentIndex: cubit.currentIndex,
              ),
              body: cubit.scrrens[cubit.currentIndex],
            ),
          );
        },
      ),
    );
  }
}
