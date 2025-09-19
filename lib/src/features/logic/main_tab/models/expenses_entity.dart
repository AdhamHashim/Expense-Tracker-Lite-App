import 'package:hive/hive.dart';

import '../../../../config/res/config_imports.dart';
import '../../add_expenses/models/category_entity.dart';

class ExpensesEntity {
  final int id;
  final double amount;
  final double amountAfterConvertToDollar;
  final double currencyValueToDollar;
  final String currency;
  final String date;
  final String dateAgo;
  final CategoryEntity category;

  const ExpensesEntity({
    required this.id,
    required this.amount,
    required this.date,
    required this.dateAgo,
    required this.amountAfterConvertToDollar,
    required this.currencyValueToDollar,
    required this.currency,
    required this.category,
  });

  factory ExpensesEntity.fromJson(Map<String, dynamic> json) {
    return ExpensesEntity(
      id: json['id'],
      date: json['date'],
      dateAgo: json['dateAgo'],
      currencyValueToDollar: json['currencyValueToDollar'],
      amount: json['amount'],
      amountAfterConvertToDollar: json['amountAfterConvertToDollar'],
      currency: json['currency'],
      category: CategoryEntity.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "date": date,
        "dateAgo": dateAgo,
        "currencyValueToDollar": currencyValueToDollar,
        "amountAfterConvertToDollar": amountAfterConvertToDollar,
        "currency": currency,
        "category": category.toJson(),
      };
}

class ExpensesEntityAdapter extends TypeAdapter<ExpensesEntity> {
  @override
  ExpensesEntity read(BinaryReader reader) {
    final id = reader.readInt();
    final amount = reader.readDouble();
    final date = reader.readString();
    final dateAgo = reader.readString();
    final currency = reader.readString();
    final category = reader.read() as CategoryEntity;
    final currencyValueToDollar = reader.readDouble();
    final amountAfterConvertToDollar = reader.readDouble();

    return ExpensesEntity(
      id: id,
      amount: amount,
      date: date,
      currency: currency,
      dateAgo: dateAgo,
      category: category,
      currencyValueToDollar: currencyValueToDollar,
      amountAfterConvertToDollar: amountAfterConvertToDollar,
    );
  }

  @override
  int get typeId => HiveBoxesConstant.expensesTypeID;

  @override
  void write(BinaryWriter writer, ExpensesEntity object) {
    writer.writeInt(object.id);
    writer.writeDouble(object.amount);
    writer.writeString(object.date);
    writer.writeString(object.dateAgo);
    writer.writeString(object.currency);
    writer.write(object.category);
    writer.writeDouble(object.currencyValueToDollar);
    writer.writeDouble(object.amountAfterConvertToDollar);
  }
}
