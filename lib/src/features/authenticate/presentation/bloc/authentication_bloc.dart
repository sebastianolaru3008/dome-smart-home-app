import 'package:bloc/bloc.dart';
import 'package:dome_smart_home_app/src/features/authenticate/services/api/authentication_service.dart';

import '../../../users_list/domain/user_entity.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService authenticationService;

  AuthenticationBloc({required this.authenticationService})
      : super(AuthenticationInitial()) {
    on<RegisterButtonPressed>((_, emit) {
      emit(AuthenticationRegister());
    });
    on<AuthenticateUser>((event, emit) {
      authenticationService.registerUser(UserEntity(
          name: event.name,
          email: event.email,
          password: event.password,
          role: Role.other));
      emit(AuthenticationInitial());

    });

    on<GoToLoginPage>((_, emit) {
      emit(AuthenticationInitial());
    });
    on<LoginEvent>(_loginUser);
  }

  _loginUser(LoginEvent event, Emitter<AuthenticationState> emit) {
    final user = authenticationService.loginUser(event.email, event.password);
    if (user != null) {
      emit(AuthenticationSucceed(role: user.role));
    } else {
      emit(const AuthenticationInitial(hasError: true));
    }
  }
}
