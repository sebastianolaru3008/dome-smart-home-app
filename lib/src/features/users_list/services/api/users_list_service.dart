import 'package:dome_smart_home_app/src/features/users_list/domain/user_entity.dart';

abstract class UsersListService {
  List<UserEntity> get familyMembers;

  void addFamilyMember(String email, String role);

  void deleteFamilyMember(UserEntity userEntity);


}
