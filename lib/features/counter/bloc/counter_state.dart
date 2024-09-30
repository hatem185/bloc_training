part of 'counter_bloc.dart';

@immutable
sealed class CounterState extends Equatable {
  final int counter;

  const CounterState(this.counter);
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0);

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}

final class CounterSuccess extends CounterState {
  const CounterSuccess(super.counter);

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
