import '../../../users_list/domain/user_entity.dart';
import '../api/authentication_service.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  List<UserEntity> users = [
     UserEntity(name: "John",email:"john@gmail.com", password:"john",role: "Parent"),
     UserEntity(name: "Gabriella",email:"gabriella@gmail.com", password: "gabriella", role: "Parent"),
     UserEntity(name: "Justin",email: "justin@gmail.com", password:"justin",role: "Kid"),
     UserEntity(name: "Consuela",email:"consuela@gmail.com", password:"consuela", role: "Grandparent"),
     UserEntity(name: "Bob",email:"bob@gmail.com",password:"bob",role: "Grandparent"),
     UserEntity(name: "Oana",email:"oana@gmail.com",password:"oana",role: "")
  ];

  @override
  List<UserEntity> get allUsers => users;

  @override
  void registerUser(UserEntity userEntity) {
    users.add(userEntity);
  }

}