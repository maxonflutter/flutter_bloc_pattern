import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodoEvent, TodosState> {
  TodosBloc() : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<UpdateTodo>(_onUpdateTodo);
  }
  void _onLoadTodos(
    LoadTodos event,
    Emitter<TodosState> emit,
  ) {
    emit(
      TodosLoaded(todos: event.todos),
    );
  }

  void _onAddTodo(
    AddTodo event,
    Emitter<TodosState> emit,
  ) {
    final state = this.state;
    if (state is TodosLoaded) {
      emit(
        TodosLoaded(
          todos: List.from(state.todos)..add(event.todo),
        ),
      );
    }
  }

  void _onDeleteTodo(
    DeleteTodo event,
    Emitter<TodosState> emit,
  ) {}

  void _onUpdateTodo(
    UpdateTodo event,
    Emitter<TodosState> emit,
  ) {
    final state = this.state;
    print(event.todo);
    if (state is TodosLoaded) {
      print(state.todos);
      state.todos[event.index] = event.todo;
      print(state.todos);
      emit(
        TodosLoaded(todos: state.todos),
      );
    }
  }
}
