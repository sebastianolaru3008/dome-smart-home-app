import '../../domain/user_entity.dart';
import '../api/users_list_service.dart';

class UsersListServiceImpl implements UsersListService {
  List<UserEntity> entities = [
    const UserEntity(name: "John", role: "Parent"),
    const UserEntity(name: "Gabriella", role: "Parent"),
    const UserEntity(name: "Justin", role: "Kid"),
    const UserEntity(name: "Consuela", role: "Grandparent"),
    const UserEntity(name: "Bob", role: "Grandparent")
  ];

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
}
