import 'package:equatable/equatable.dart';

class Preset extends Equatable {
  const Preset({
    required this.id,
    required this.name,
    required this.description,
    this.image,
  });

  final String id;
  final String name;
  final String description;
  final String? image;

  Preset copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
  }) {
    return Preset(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [id, name, description, image];
}
