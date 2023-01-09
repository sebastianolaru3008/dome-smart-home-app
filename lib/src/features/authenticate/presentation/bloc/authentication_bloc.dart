import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/services/api/authentication_service.dart';

import '../../../users_list/domain/user_entity.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthenticationService authenticationService}) : super(AuthenticationInitial()) {
    on<RegisterButtonPressed>((_, emit) {
      emit(AuthenticationRegister());
    });
    on<AuthenticateUser>((_, emit) {
      emit(const AuthenticationSucceed(role: Role.grandparent));
    });
    on<GoToLoginPage>((_, emit) {
      emit(AuthenticationInitial());
    });
  }
}
