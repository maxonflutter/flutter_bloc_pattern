import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/blocs/todos/todos_bloc.dart';
import 'package:flutter_bloc_pattern/blocs/todos_filter/todos_filter_bloc.dart';
import 'package:flutter_bloc_pattern/models/todos_filter_model.dart';

import '/models/models.dart';
import '/screens/screens.dart';
import '/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BloC Pattern: To Dos'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTodoScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
          bottom: TabBar(
            onTap: (tabIndex) {
              switch (tabIndex) {
                case 0:
                  BlocProvider.of<TodosFilterBloc>(context).add(
                    UpdateTodos(
                      todosFilter: TodosFilter.pending,
                    ),
                  );
                  break;
                case 1:
                  BlocProvider.of<TodosFilterBloc>(context).add(
                    UpdateTodos(
                      todosFilter: TodosFilter.completed,
                    ),
                  );
                  break;
              }
            },
            tabs: const [
              Tab(icon: Icon(Icons.pending)),
              Tab(icon: Icon(Icons.add_task)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _todos('Pending To Dos'),
            _todos('Completed To Dos'),
          ],
        ),
      ),
    );
  }

  BlocBuilder<TodosFilterBloc, TodosFilterState> _todos(
    String title,
  ) {
    return BlocBuilder<TodosFilterBloc, TodosFilterState>(
      builder: (context, state) {
        if (state is TodosFilterLoading) {
          return const CircularProgressIndicator();
        }
        if (state is TodosFilterLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.filteredTodos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _todoCard(context, state.filteredTodos[index]);
                  },
                ),
              ],
            ),
          );
        } else {
          return const Text('Something went wrong!');
        }
      },
    );
  }

  Card _todoCard(BuildContext context, Todo todo) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#${todo.id}: ${todo.task}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<TodosBloc>().add(
                          UpdateTodo(
                            todo: todo.copyWith(isCompleted: true),
                          ),
                        );
                  },
                  icon: const Icon(Icons.add_task),
                ),
                IconButton(
                  onPressed: () {
                    context.read<TodosBloc>().add(
                          DeleteTodo(todo: todo),
                        );
                  },
                  icon: const Icon(Icons.cancel),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
