import 'package:flutter/material.dart';
import 'package:flutter_todo_sqlite/entity/task.dart';
import 'package:flutter_todo_sqlite/providers/task_provider.dart';
import 'package:flutter_todo_sqlite/widget/home/card_task.dart';
import 'package:flutter_todo_sqlite/widget/home/form_add_todo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).fetchDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const FormAddTodo(),
            elevation: 0,
            isDismissible: true,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [
          const UserInfo(),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: FutureBuilder(
              builder: (_, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<TaskProvider>(builder: (_, taskProvider, _2) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ReorderableListView.builder(
                            itemBuilder: (_, idx) {
                              Task taskData = taskProvider.tasks[idx];
                              return CardTask(
                                taskData,
                                key: ValueKey(taskData.id),
                              );
                            },
                            itemCount: taskProvider.tasks.length,
                            onReorder: (past, after) {
                              print('$past,$after');
                            },
                          ),
                        );
                      });
              },
              future: Provider.of<TaskProvider>(context, listen: false)
                  .fetchDataFromDatabase(),
            ),
          )
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello,\n',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    const TextSpan(
                      text: 'Wendy Winata',
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white10,
                      blurRadius: 16,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/girl_avatar.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              DateFormat('EEEE, d MMMM y').format(DateTime.now()),
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        PopupMenuButton(itemBuilder: (ctx) {
          return const [
            PopupMenuItem(
              child: Text('Settings'),
            )
          ];
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
