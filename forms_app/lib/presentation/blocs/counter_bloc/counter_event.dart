part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

/// name in past
class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased(this.value);
}

/// name in past
class CounterReset extends CounterEvent {}
