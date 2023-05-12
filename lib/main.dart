import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2/shared/component/BlocObserver%20.dart';
import 'package:todoapp2/shared/style/My_Theme_Data.dart';

import 'layout/homePage.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.Lighttheme,
      routes: {
        homePade.id: (context) => homePade(),
      },
      initialRoute: homePade.id,
    );
  }
}
