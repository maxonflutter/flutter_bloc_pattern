part of 'todos_filter_bloc.dart';

abstract class TodosFilterEvent extends Equatable {
  const TodosFilterEvent();

  @override
  List<Object> get props => [];
}

class UpdateTodos extends TodosFilterEvent {
  final TodosFilter todosFilter;

  const UpdateTodos({
    this.todosFilter = TodosFilter.pending,
  });

  @override
  List<Object> get props => [todosFilter];
}
