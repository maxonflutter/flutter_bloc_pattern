import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_pattern/blocs/todos/todos_bloc.dart';

part 'todos_counter_event.dart';
part 'todos_counter_state.dart';

class TodosCounterBloc extends Bloc<TodosCounterEvent, TodosCounterState> {
  final TodosBloc _todosBloc;
  late StreamSubscription _todosSubscription;

  TodosCounterBloc({required TodosBloc todosBloc})
      : _todosBloc = todosBloc,
        super(TodosCounterLoading()) {
    on<LoadTodosCounter>(_onLoadTodosCounter);
    on<UpdateTodosCounter>(_onUpdateTodosCounter);

    _todosSubscription = todosBloc.stream.listen((state) {
      if (state is TodosLoaded) {
        add(
          UpdateTodosCounter(counterValue: state.todos.length),
        );
      }
    });
  }

  void _onLoadTodosCounter(
    LoadTodosCounter event,
    Emitter<TodosCounterState> emit,
  ) {
    emit(
      TodosCounterLoaded(todosCount: event.initialValue),
    );
  }

  void _onUpdateTodosCounter(
    UpdateTodosCounter event,
    Emitter<TodosCounterState> emit,
  ) {
    emit(
      TodosCounterLoaded(todosCount: event.counterValue),
    );
  }

  @override
  Future<void> close() {
    _todosSubscription.cancel();
    return super.close();
  }
}
