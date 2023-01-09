import '../../domain/user_entity.dart';
import '../api/users_list_service.dart';

class UsersListServiceImpl implements UsersListService {
  List<UserEntity> entities = [
     UserEntity(name: "John",email:"john@gmail.com", password:"john",role: Role.parent),
     UserEntity(name: "Gabriella",email:"gabriella@gmail.com", password: "gabriella", role: Role.parent),
     UserEntity(name: "Justin",email: "justin@gmail.com", password:"justin",role: Role.kid),
     UserEntity(name: "Consuela",email:"consuela@gmail.com", password:"consuela", role: Role.grandparent),
     UserEntity(name: "Bob",email:"bob@gmail.com",password:"bob",role: Role.grandparent)
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
