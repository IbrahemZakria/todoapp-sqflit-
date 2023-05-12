import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp2/shared/cubit/cubitStates.dart';

import '../../moduls/archeveScreen.dart';
import '../../moduls/tasks.dart';
import '../../moduls/tassksDone.dart';

class AppCubit extends Cubit<AppStats> {
  AppCubit() : super(intialStats());
  static AppCubit get(context) => BlocProvider.of(context);
  List<Widget> scrrens = [tasks(), tassksDone(), archeveScreen()];
  late Database database;
  List<Map> Tasks = [];
  List<Map> addTasks = [];
  List<Map> doneTasks = [];
  List<Map> arciveTasks = [];

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(changeBottomNavBarState());
  }

  Future<void> createDataBase() async {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        print('database created');

        db
            .execute(
                'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('taple crated');
        }).catchError((onError) {
          print('taple error');
        });
      },
      onOpen: (db) {
        getdataFromDatabase(db);
      },
    ).then((value) {
      database = value;
      emit(appcreatedatabaseState());
    });
  }

  insertToDataase({
    required String title,
    required String date,
    required String time,
  }) async {
    database.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO Test(title, date, time,status) VALUES("$title", "$date", "$time", "ok")',
      )
          .then((value) {
        print('$value inserted sucsesfully');
        emit(appinsertdatabaseState());
        getdataFromDatabase(database);
      }).catchError((onError) {
        print('there is an error');
      });
    });
  }

  void getdataFromDatabase(database) async {
    addTasks = [];
    doneTasks = [];
    arciveTasks = [];
    database.rawQuery('SELECT * FROM Test').then((value) {
      print(Tasks);
      emit(appgetdatabaseState());
      value.forEach((element) {
        if (element['status'] == 'ok') {
          addTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          arciveTasks.add(element);
        }
      });
    });
    print(tasks);

    Tasks;
  }

  void updateintodatabase({required String status, required int id}) {
    database.rawUpdate('UPDATE Test SET status = ?  WHERE id = ?',
        ['$status', id]).then((value) {
      getdataFromDatabase(database);
      emit(appupdatedatabaseState());
    });
  }

  Icon floatIcon = Icon(Icons.edit);
  bool isBotonShown = false;
  void changebottomShet({required bool isshow, required Icon icon}) {
    floatIcon = icon;
    isBotonShown = isshow;
    emit(changeBottomsheetState());
  }

  Future<void> deletDataFromDataBase({required int id}) async {
    await database
        .rawDelete('DELETE FROM Test WHERE id = ?', [id]).then((value) {
      getdataFromDatabase(database);
      emit(appdeletdatabaseState());
    });
  }
}
