part of '../../imports/view_imports.dart';

class _CurrencyDropDownWidget extends StatefulWidget {
  const _CurrencyDropDownWidget();

  @override
  State<_CurrencyDropDownWidget> createState() =>
      _CurrencyDropDownWidgetState();
}

class _CurrencyDropDownWidgetState extends State<_CurrencyDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.height * .1,
        child: DefaultDropDownField<DropDownModel>(
          contentPadding: EdgeInsets.all(AppPadding.pW4),
          validator: (value) => Validators.noValidate(""),
          selectedItem: context.read<BalanceBloc>().state.filter,
          itemAsString: (value) => value!.name,
          asyncItems: (value) async => [
            DropDownModel(
              id: 1,
              name: LocaleKeys.lastDay,
            ),
            DropDownModel(
              id: 2,
              name: LocaleKeys.lastSevenDay,
            ),
            DropDownModel(
              id: 3,
              name: LocaleKeys.thisMonth,
            ),
          ],
          onChanged: (item) {
            final bloc = context.read<BalanceBloc>();
            switch (item?.id) {
              case 1:
                bloc.add(FetchBalanceEvent(filter: item));
                break;
              case 2:
                bloc.add(FetchBalanceEvent(filter: item));
                break;
              case 3:
                bloc.add(FetchBalanceEvent(filter: item));
                break;
              default:
                bloc.add(FetchBalanceEvent());
            }
          },
        ),
      ),
    );
  }
}
