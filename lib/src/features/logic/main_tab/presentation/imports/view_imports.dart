import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/language/locale_keys.g.dart';
import '../../../../../config/res/assets.gen.dart';
import '../../../../../config/res/config_imports.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/margin_extention.dart';
import '../../../../../core/extensions/text_style_extensions.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/navigation/navigator.dart';
import '../../../../../core/shared/base_state.dart';
import '../../../../../core/shared/models/drop_down_model.dart';
import '../../../../../core/widgets/drop_down_button.dart';
import '../../../../../core/widgets/not_contain_data.dart';
import '../../../add_expenses/presentation/imports/view_imports.dart';
import '../../../view_all_expenses/presentation/imports/view_imports.dart';
import '../../models/balance_entity.dart';
import '../../models/expenses_entity.dart';

//...Widgets
part '../screen/main_tab_view.dart';
part '../widgets/main_tab_body.dart';

//...Widgets
part '../widgets/body_components/balance_card_widget.dart';
part '../widgets/expnses_components/expenses_card_widget.dart';
part '../widgets/body_components/expenses_elements_widget.dart';
part '../widgets/body_components/header_widget.dart';

//...Header_Components
part '../widgets/header_components/currency_drop_down_widget.dart';
part '../widgets/header_components/user_info_widget.dart';
part '../widgets/header_components/card_with_circle_bg_widget.dart';

//...balance_card_components
part '../widgets/balance_card_components/income_with_expenses_widget.dart';
part '../widgets/balance_card_components/total_balance_widget.dart';
part '../widgets/expnses_components/view_all_expenses_widget.dart';

//...Blocs
part '../blocs/balance_bloc.dart';
part '../blocs/balance_event.dart';
part '../blocs/balnce_state.dart';
