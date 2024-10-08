import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncEvent>(_onCounterIncEvent);
    on<CounterDecEvent>(_onCounterDecEvent);
  }

  _onCounterIncEvent(CounterIncEvent event, Emitter<CounterState> emit) {
    print("CounterIncEvent");
    emit(CounterSuccess(state.counter + 1));
  }

  _onCounterDecEvent(CounterDecEvent event, Emitter<CounterState> emit) {
    print("CounterDecEvent");
    emit(CounterSuccess(state.counter - 1));
  }
}
