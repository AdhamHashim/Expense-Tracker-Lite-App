import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../../config/res/config_imports.dart';
import 'expenses_entity.dart';

class BalanceEntity {
  final double totalBalance;
  final double incomeBalance;
  final double expensesBalance;
  final List<ExpensesEntity> expenses;

  const BalanceEntity({
    required this.totalBalance,
    required this.incomeBalance,
    required this.expensesBalance,
    required this.expenses,
  });

  factory BalanceEntity.initial() {
    return const BalanceEntity(
      totalBalance: 10000,
      incomeBalance: 0,
      expensesBalance: 0,
      expenses: [],
    );
  }

  factory BalanceEntity.fromJson(Map<String, dynamic> json) {
    return BalanceEntity(
      totalBalance: json['totalBalance'],
      incomeBalance: json['incomeBalance'],
      expensesBalance: json['expensesBalance'],
      expenses: (jsonDecode(json['expenses']) as List)
          .map((e) => ExpensesEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "totalBalance": totalBalance,
        "incomeBalance": incomeBalance,
        "expensesBalance": expensesBalance,
        "expenses": jsonEncode(expenses.map((e) => e.toJson()).toList()),
      };
}

class BalanceEntityAdapter extends TypeAdapter<BalanceEntity> {
  @override
  BalanceEntity read(BinaryReader reader) {
    final totalBalance = reader.readDouble();
    final incomeBalance = reader.readDouble();
    final expensesBalance = reader.readDouble();
    // Read the list
    final expensesLength = reader.readInt();
    final expenses = <ExpensesEntity>[];
    for (var i = 0; i < expensesLength; i++) {
      expenses.add(reader.read() as ExpensesEntity);
    }
    return BalanceEntity(
      totalBalance: totalBalance,
      incomeBalance: incomeBalance,
      expensesBalance: expensesBalance,
      expenses: expenses,
    );
  }

  @override
  int get typeId => HiveBoxesConstant.balanceTypeID;

  @override
  void write(BinaryWriter writer, BalanceEntity object) {
    writer.writeDouble(object.totalBalance);
    writer.writeDouble(object.incomeBalance);
    writer.writeDouble(object.expensesBalance);
    // Write the list
    writer.writeInt(object.expenses.length);
    for (var expense in object.expenses) {
      writer.write(expense);
    }
  }
}
