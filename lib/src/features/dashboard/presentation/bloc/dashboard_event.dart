part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardEventBottomNavigationChanged extends DashboardEvent {
  const DashboardEventBottomNavigationChanged({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}
