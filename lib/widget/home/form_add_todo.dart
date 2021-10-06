import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_sqlite/providers/task_provider.dart';
import 'package:flutter_todo_sqlite/widget/multi_used/custom_text_field.dart';
import 'package:provider/provider.dart';

class FormAddTodo extends StatefulWidget {
  const FormAddTodo({Key? key}) : super(key: key);

  @override
  State<FormAddTodo> createState() => _FormAddTodoState();
}

class _FormAddTodoState extends State<FormAddTodo> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, Object> inputField = {
    'title': '',
    'description': '',
    'progress': '',
  };

  void onFormInputed() async {
    _formKey.currentState?.save();

    await Provider.of<TaskProvider>(context, listen: false)
        .insertToDatabase(inputField);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                title: 'Task Title',
                onSaved: (val) {
                  inputField['title'] = val.toString();
                },
              ),
              CustomTextField(
                title: 'Description',
                maxLines: 4,
                inputType: TextInputType.multiline,
                onSaved: (val) {
                  inputField['description'] = val.toString();
                },
              ),
              CustomTextField(
                title: 'Progress',
                inputType: TextInputType.number,
                onSaved: (val) {
                  inputField['progress'] = val.toString();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: onFormInputed,
                child: const Text('ADD TASK'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
