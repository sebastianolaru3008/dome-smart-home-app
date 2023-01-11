import 'package:equatable/equatable.dart';

class VoiceCommandEntity extends Equatable {
  const VoiceCommandEntity({
    required this.name
  });

  final String name;

  @override
  List<Object?> get props => [name];
}
