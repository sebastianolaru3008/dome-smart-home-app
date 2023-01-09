import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  UserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.isHome = false,
  });

  final String name;
  final String email;
  final String password;
  late Role role;
   bool isHome;

  @override
  List<Object?> get props => [name, role, isHome];
}

enum Role { parent, kid, grandparent, other, none }

extension ParseToString on Role {
  String toSentenceCaseString() {
    var word = this.toString().split('.').last;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }
}
