part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState();
}

class TimerInitial extends TimerState {
  @override
  List<Object> get props => [];
}

class TimerInitialized extends TimerState {
  // key is device id
  final Map<int, int> secondsRemaining;
  final Map<int, bool> isRunning;

  const TimerInitialized({required this.secondsRemaining, required this.isRunning});

  @override
  List<Object?> get props => [secondsRemaining, isRunning];

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is! TimerInitialized;
  }

  @override
  int get hashCode => secondsRemaining.hashCode ^ isRunning.hashCode;
}
