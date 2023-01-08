part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    required this.bottomNavigationIndex,
    required this.areBarsShowing,
  });

  const DashboardState.initial({
    this.bottomNavigationIndex = 0,
    this.areBarsShowing = true,
  });

  final int bottomNavigationIndex;
  final bool areBarsShowing;

  DashboardState copyWith({
    int? bottomNavigationIndex,
    bool? areBarsShowing,
  }) {
    return DashboardState(
      bottomNavigationIndex:
          bottomNavigationIndex ?? this.bottomNavigationIndex,
      areBarsShowing: areBarsShowing ?? this.areBarsShowing,
    );
  }

  @override
  List<Object?> get props => [bottomNavigationIndex, areBarsShowing];
}
