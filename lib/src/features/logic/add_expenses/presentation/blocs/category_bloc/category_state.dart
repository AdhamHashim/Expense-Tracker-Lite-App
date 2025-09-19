part of '../../imports/view_imports.dart';

final class CategoryState extends Equatable {
  final List<CategoryEntity> categories;

  const CategoryState({required this.categories});

  factory CategoryState.initial() {
    return const CategoryState(categories: []);
  }

  CategoryState copyWith({
    List<CategoryEntity>? categories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [categories];
}
