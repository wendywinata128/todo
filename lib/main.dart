import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_sqlite/other/constant.dart';
import 'package:flutter_todo_sqlite/providers/task_provider.dart';
import 'package:flutter_todo_sqlite/widget/home/form_add_todo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        title: 'ToDo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primaryColor: const Color.fromRGBO(80, 171, 120, 1),
          // accentColor: const Color.fromRGBO(80, 171, 120, 1),
          colorScheme: Constant.COLOR_SCHEME,
          appBarTheme: AppBarTheme(
            color: const Color.fromRGBO(80, 171, 120, 1),
            titleTextStyle: const AppBarTheme().titleTextStyle?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
