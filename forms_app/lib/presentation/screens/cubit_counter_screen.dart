import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/cubit/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    /// Con referencia al state
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        /// Con referencia al state
        // title: Text('Cubit counter: ${counterState.transactionCount}'),

        /// Otra manera
        title: context.select((CounterCubit value) =>
            Text('Cubit counter: ${value.state.transactionCount}')),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterCubit>().reset(),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
            // buildWhen: (previous, current) => current.counter != previous.counter,
            builder: (context, state) {
          // print('counter cambio');
          return Text('Counter value: ${state.counter}');
        }),
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
      onPressed: () => context.read<CounterCubit>().increaseBy(value),
    );
  }
}
