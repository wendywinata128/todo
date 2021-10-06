import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_sqlite/entity/task.dart';
import 'package:flutter_todo_sqlite/other/constant.dart';

class CardTask extends StatelessWidget {
  final Task task;

  const CardTask(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: DefaultTextStyle.merge(
        style: const TextStyle(
          color: Colors.white,
        ),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                task.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Constant.COLOR_SCHEME.primary,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
