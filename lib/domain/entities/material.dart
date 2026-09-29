import 'package:equatable/equatable.dart';

class Material extends Equatable {
  const Material({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    this.image,
  });

  final String id;
  final String title;
  final String description;
  final double quantity;

  /// Local filesystem path to the material image, if set.
  final String? image;

  Material copyWith({
    String? id,
    String? title,
    String? description,
    double? quantity,
    String? image,
  }) {
    return Material(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [id, title, description, quantity, image];
}
