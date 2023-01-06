import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/devices/services/api/devices_service.dart';
import 'package:equatable/equatable.dart';

part 'devices_event.dart';
part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  DevicesBloc({required DevicesService devicesService}) : super(DevicesInitial()) {
    on<DevicesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
