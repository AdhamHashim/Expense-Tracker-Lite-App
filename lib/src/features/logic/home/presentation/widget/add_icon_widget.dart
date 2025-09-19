part of '../imports/presentation_imports.dart';

class AddiconWidget extends StatelessWidget {
  const AddiconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Go.to(BlocProvider.value(
        value: context.read<BalanceBloc>(),
        child: const AddExpensesScreen(),
      )),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppMargin.mH4),
        padding: EdgeInsets.all(AppPadding.pH4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.buttonColor,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: AppSize.sH20,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
