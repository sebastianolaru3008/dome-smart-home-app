import 'package:dome_smart_home_app/src/features/authenticate/services/api/authentication_service.dart';

import '../../domain/user_entity.dart';
import '../api/users_list_service.dart';

class UsersListServiceImpl implements UsersListService {
  List<UserEntity> entities = [
     UserEntity(name: "John",email:"john@gmail.com", password:"john",role: "Parent"),
     UserEntity(name: "Gabriella",email:"gabriella@gmail.com", password: "gabriella", role: "Parent"),
     UserEntity(name: "Justin",email: "justin@gmail.com", password:"justin",role: "Kid"),
     UserEntity(name: "Consuela",email:"consuela@gmail.com", password:"consuela", role: "Grandparent"),
     UserEntity(name: "Bob",email:"bob@gmail.com",password:"bob",role: "Grandparent")
  ];

  @override
  List<UserEntity> get familyMembers => entities;

  @override
  void addFamilyMember(String email, String role) {
    //authService= locator.get<AuthenticationService>();
  }

  @override
  void deleteFamilyMember(UserEntity userEntity) {
    entities.remove(userEntity);
  }
}
