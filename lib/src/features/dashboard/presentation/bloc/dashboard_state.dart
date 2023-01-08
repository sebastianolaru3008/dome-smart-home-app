part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({required this.bottomNavigationIndex});

  const DashboardState.initial({this.bottomNavigationIndex = 0});

  final int bottomNavigationIndex;

  DashboardState copyWith({
    int? bottomNavigationIndex,
  }) {
    return DashboardState(
      bottomNavigationIndex:
          bottomNavigationIndex ?? this.bottomNavigationIndex,
    );
  }

  @override
  List<Object?> get props => [bottomNavigationIndex];
}
