import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.name,
    required this.role,
  });

  final String name;
  final String role;

  @override
  List<Object?> get props => [name, role];
}
