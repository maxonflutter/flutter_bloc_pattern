part of 'todos_counter_bloc.dart';

abstract class TodosCounterEvent extends Equatable {
  const TodosCounterEvent();

  @override
  List<Object> get props => [];
}

class LoadTodosCounter extends TodosCounterEvent {
  final int initialValue;

  const LoadTodosCounter({required this.initialValue});

  @override
  List<Object> get props => [initialValue];
}

class UpdateTodosCounter extends TodosCounterEvent {
  final int counterValue;

  const UpdateTodosCounter({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}
