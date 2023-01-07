import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  const DeviceEntity({required this.name, this.imageAssetPath, this.state});

  final String name;
  final String? imageAssetPath;
  final String? state;

  @override
  List<Object?> get props => [name, imageAssetPath, state];
}