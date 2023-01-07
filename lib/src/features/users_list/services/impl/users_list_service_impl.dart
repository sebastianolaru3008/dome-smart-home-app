import 'package:dome_smart_home_app/src/features/example/domain/example_entity.dart';

import '../../domain/user_entity.dart';
import '../api/users_list_service.dart';



class UsersListServiceImpl implements UsersListService {

  final List<UserEntity> entities = [
    const UserEntity(name: "John", role: "Parent"),
    const UserEntity(name: "Gabriella", role: "Parent"),
    const UserEntity(name: "Justin", role: "Kid"),
    const UserEntity(name: "Consuela", role: "Grandparent"),
    const UserEntity(name: "Bob", role: "Grandparent")
  ];

  late UserEntity currentUser;

  @override
  List<UserEntity> get familyMembers => entities;


  @override
  void addFamilyMember(UserEntity userEntity) {
     entities.add(userEntity);
  }

  @override
  void deleteFamilyMember(UserEntity userEntity) {
    entities.remove(userEntity);
  }

  @override
  void setCurrentUser(UserEntity userEntity) {
    currentUser = userEntity;
  }

  @override
  UserEntity getCurrentUser() {
    return currentUser;
  }
}
