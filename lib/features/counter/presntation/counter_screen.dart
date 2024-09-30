import 'package:bloc_training_app/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: CounterScreenView(),
    );
  }
}

class CounterScreenView extends StatelessWidget {
  const CounterScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) => Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 31),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CounterBloc>().add(CounterIncEvent());
        },
      ),
    );
  }
}
