part of '../../imports/view_imports.dart';

class _CurrencyDropDownWidget extends StatelessWidget {
  const _CurrencyDropDownWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.height * .1,
        child: DefaultDropDownField<DropDownModel>(
          contentPadding: EdgeInsets.all(AppPadding.pW4),
          selectedItem: DropDownModel.initial(),
          asyncItems: (value) async => [
            DropDownModel.initial(),
            DropDownModel(id: 1, name: "name"),
          ],
          itemAsString: (value) => value!.name,
        ),
      ),
    );
  }
}
