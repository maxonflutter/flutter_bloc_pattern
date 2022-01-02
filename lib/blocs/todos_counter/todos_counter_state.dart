part of 'todos_counter_bloc.dart';

abstract class TodosCounterState extends Equatable {
  const TodosCounterState();

  @override
  List<Object> get props => [];
}

class TodosCounterLoading extends TodosCounterState {}

class TodosCounterLoaded extends TodosCounterState {
  final int todosCount;

  const TodosCounterLoaded({this.todosCount = 0});

  @override
  List<Object> get props => [todosCount];
}
