import 'package:flutter/material.dart';
import 'package:todoapp2/shared/cubit/cubit.dart';

Widget default_button(
    {required Function ontap,
    Color color = Colors.blue,
    required Text text,
    double width = double.infinity}) {
  return Container(
    width: width,
    margin: EdgeInsets.only(
      left: 10,
      right: 10,
      bottom: 10,
      top: 10,
    ),
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Center(
      child: InkWell(
        onTap: () {
          ontap();
        },
        child: Text(
          '$text',
        ),
      ),
    ),
  );
}

Widget buildTaskItem(Map model, context) {
  return Dismissible(
    direction: DismissDirection.startToEnd,
    background: Container(
      alignment: Alignment.centerLeft,
      color: Colors.red,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
      ),
    ),
    onDismissed: (direction) {
      AppCubit.get(context).deletDataFromDataBase(id: model['id']);
    },
    key: Key(model['id'].toString()),
    child: Container(
      padding: EdgeInsets.all(10),
      child: Row(children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 40,
          child: Text(model['title']),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(model['date']), Text(model['time'])],
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateintodatabase(status: 'done', id: model['id']);
                },
                icon: Icon(
                  Icons.check_box,
                  size: 30,
                  color: Colors.blue,
                )),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateintodatabase(status: 'Archive', id: model['id']);
              },
              icon: Icon(
                Icons.archive,
                size: 30,
                color: Colors.grey[700],
              ),
            ),
          ],
        )),
      ]),
    ),
  );
}
