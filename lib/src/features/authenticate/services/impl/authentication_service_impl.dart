import '../../../users_list/domain/user_entity.dart';
import '../api/authentication_service.dart';
import 'package:collection/collection.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  List<UserEntity> users = [
    UserEntity(
        name: "John",
        email: "john@gmail.com",
        password: "john",
        role: Role.parent),
    UserEntity(
        name: "Gabriella",
        email: "gabriella@gmail.com",
        password: "gabriella",
        role: Role.parent),
    UserEntity(
        name: "Justin",
        email: "justin@gmail.com",
        password: "justin",
        role: Role.kid),
    UserEntity(
        name: "Consuela",
        email: "consuela@gmail.com",
        password: "consuela",
        role: Role.grandparent),
    UserEntity(
        name: "Bob",
        email: "bob@gmail.com",
        password: "bob",
        role: Role.grandparent),
    UserEntity(
        name: "Oana",
        email: "oana@gmail.com",
        password: "oana",
        role: Role.none),
    UserEntity(
      name: "PARENT",
      email: "p",
      password: "p",
      role: Role.parent,
    ),
    UserEntity(
      name: "KID",
      email: "k",
      password: "k",
      role: Role.kid,
    ),
    UserEntity(
      name: "GRANDPARENT",
      email: "g",
      password: "g",
      role: Role.grandparent,
    ),
    UserEntity(
      name: "OTHER",
      email: "o",
      password: "o",
      role: Role.other,
    ),
  ];

  @override
  List<UserEntity> get allUsers => users;

  @override
  void registerUser(UserEntity userEntity) {
    users.add(userEntity);
  }

  @override
  UserEntity? loginUser(String email, String password) {
    return users.firstWhereOrNull(
      (user) => user.email == email && user.password == password,
    );
  }
}
