import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              LoadTodos(
                todos: [
                  Todo(
                    id: '1',
                    task: 'BloC Pattern Video',
                    description: 'Explain what is the BloC Pattern',
                  ),
                  Todo(
                    id: '2',
                    task: 'BloC Pattern Video #2',
                    description: 'Explain what is the BloC Pattern',
                  ),
                ],
              ),
            ),
        ),
        BlocProvider(
          create: (context) => TodosCounterBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          )..add(
              LoadTodosCounter(
                  initialValue:
                      (BlocProvider.of<TodosBloc>(context).state as TodosLoaded)
                          .todos
                          .length),
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
