part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncEvent extends CounterEvent{

}
class CounterDecEvent extends CounterEvent{

}