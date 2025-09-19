import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../config/res/config_imports.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String icon;
  final String title;
  final bool selected;

  const CategoryEntity({
    required this.id,
    required this.icon,
    required this.title,
    this.selected = false,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      id: json['id'],
      icon: json['icon'],
      title: json['title'],
    );
  }

  CategoryEntity copyWith({required bool select}) {
    return CategoryEntity(
      id: id,
      icon: icon,
      title: title,
      selected: select,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "title": title,
      };

  @override
  List<Object?> get props => [id, icon, title];
}

class CategoryEntityAdapter extends TypeAdapter<CategoryEntity> {
  @override
  CategoryEntity read(BinaryReader reader) {
    final id = reader.readInt();
    final title = reader.readString();
    final icon = reader.readString();
    return CategoryEntity(
      id: id,
      title: title,
      icon: icon,
    );
  }

  @override
  int get typeId => HiveBoxesConstant.categoryTypeID;

  @override
  void write(BinaryWriter writer, CategoryEntity object) {
    writer.writeInt(object.id);
    writer.writeString(object.title);
    writer.writeString(object.icon);
  }
}
