import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String image;
  final String title;

  const CategoryModel({
    required this.id,
    required this.image,
    required this.title,
  });

  @override
  List<Object?> get props => [id, image, title];
}
