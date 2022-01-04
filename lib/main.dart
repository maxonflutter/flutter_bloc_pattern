import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/blocs/todos/todos_bloc.dart';

import '/blocs/blocs.dart';
import '/models/models.dart';
import '/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              LoadTodos(todos: [
                Todo(
                  id: '1',
                  task: 'Sample ToDo 1',
                  description: 'This is a test To Do',
                ),
                Todo(
                  id: '2',
                  task: 'Sample ToDo 2',
                  description: 'This is a test To Do',
                ),
              ]),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'BloC Pattern - Todos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF000A1F),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF000A1F),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
