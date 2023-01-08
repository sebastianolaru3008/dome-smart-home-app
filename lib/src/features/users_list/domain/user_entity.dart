import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
   UserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  final String name;
  final String email;
  final String password;
  late String role;

  @override
  List<Object?> get props => [name, role];
}
