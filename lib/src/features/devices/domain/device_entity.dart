import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  const DeviceEntity({required this.name, this.full_name, this.imageAssetPath, this.state, this.type});

  final String name;
  final String? full_name;
  final String? imageAssetPath;
  final String? state;
  final String? type;

  @override
  List<Object?> get props => [name, full_name, imageAssetPath, state, type];
}