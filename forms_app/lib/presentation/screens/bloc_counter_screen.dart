import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) =>
            Text('Bloc counter: ${counterBloc.state.transactionCount}')),
        actions: [
          IconButton(
              // onPressed: () => context.read<CounterBloc>().add(CounterReset()),
              onPressed: () => context.read<CounterBloc>().resetCounter(),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
            Text('Counter value: ${counterBloc.state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _floatingActionButton(context, value: 3),
          const SizedBox(height: 15),
          _floatingActionButton(context, value: 2),
          const SizedBox(height: 15),
          _floatingActionButton(context, value: 1),
        ],
      ),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context,
      {required int value}) {
    return FloatingActionButton(
      heroTag: value,
      child: Text('+$value'),
      // onPressed: () => context.read<CounterBloc>().add(CounterIncreased(value)),
      onPressed: () => context.read<CounterBloc>().increaseBy(value),
    );
  }
}
