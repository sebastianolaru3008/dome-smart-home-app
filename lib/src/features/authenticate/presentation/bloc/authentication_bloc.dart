import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/services/api/authentication_service.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthenticationService authenticationService}) : super(AuthenticationInitial()) {
    on<RegisterButtonPressed>((event, emit) {
      emit(AuthenticationRegister());
    });
    on<LoginButtonPressed>((event, emit) {
      emit(AuthenticationSucceed());
    });
    on<RegisterButtonPressedInRegisterPage>((event, emit) {
      emit(AuthenticationSucceed());
    });
    on<GoToLoginPage>((event, emit) {
      emit(AuthenticationInitial());
    });
  }
}
