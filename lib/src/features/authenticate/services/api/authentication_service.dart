import '../../../users_list/domain/user_entity.dart';

abstract class AuthenticationService {
  List<UserEntity> get allUsers;

  void registerUser(UserEntity userEntity);

}