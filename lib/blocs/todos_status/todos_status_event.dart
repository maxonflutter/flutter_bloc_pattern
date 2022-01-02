part of 'todos_status_bloc.dart';

abstract class TodosStatusEvent extends Equatable {
  const TodosStatusEvent();

  @override
  List<Object> get props => [];
}

class UpdateTodosStatus extends TodosStatusEvent {
  final List<Todo> todos;

  const UpdateTodosStatus({this.todos = const <Todo>[]});

  @override
  List<Object> get props => [todos];
}
