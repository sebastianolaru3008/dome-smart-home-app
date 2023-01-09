import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState.initial()) {
    on<DashboardEventBottomNavigationChanged>(_onBottomNavigationChanged);
    on<DashboardEventShowBars>(_onShowBars);
  }

  void _onBottomNavigationChanged(
    DashboardEventBottomNavigationChanged event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(bottomNavigationIndex: event.index));
  }

  void _onShowBars(DashboardEventShowBars event, Emitter<DashboardState> emit) {
    emit(state.copyWith(areBarsShowing: event.areBarsShowing));
  }
}
