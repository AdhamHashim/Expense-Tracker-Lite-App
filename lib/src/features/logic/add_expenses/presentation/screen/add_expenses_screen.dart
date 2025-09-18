part of '../imports/view_imports.dart';

class AddExpensesScreen extends StatelessWidget {
  const AddExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AddExpensesView();
  }
}

class _AddExpensesView extends StatelessWidget {
  const _AddExpensesView();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: LocaleKeys.addExpense,
      body: const _AddExpensesBody(),
    );
  }
}
