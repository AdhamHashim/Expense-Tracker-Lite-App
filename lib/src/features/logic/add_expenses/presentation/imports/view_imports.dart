import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/language/locale_keys.g.dart';
import '../../../../../config/res/assets.gen.dart';
import '../../../../../config/res/config_imports.dart';
import '../../../../../core/base_crud/code/domain/base_domain_imports.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/extensions/seperator_helper.dart';
import '../../../../../core/extensions/sized_box_helper.dart';
import '../../../../../core/extensions/text_style_extensions.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/navigation/navigator.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/shared/base_state.dart';
import '../../../../../core/widgets/buttons/loading_button.dart';
import '../../../../../core/widgets/custom_messages.dart';
import '../../../../../core/widgets/default_bottom_sheet.dart';
import '../../../../../core/widgets/drop_down_button.dart';
import '../../../../shared_widgets/imports/shared_widgets_imports.dart';
 import '../../../home/presentation/imports/presentation_imports.dart';
import '../../models/add_category_params.dart';
import '../../models/add_expenses_params.dart';
import '../../models/category_entity.dart';
import '../../models/currency_entity.dart';

part '../screen/add_expenses_screen.dart';
part '../widgets/add_expenses_body.dart';
part '../widgets/add_expenses_form_widget.dart';
part '../widgets/categories_section_widget.dart';
part '../widgets/dialogs/add_category_model_sheet.dart';

part '../blocs/category_bloc/category_bloc.dart';
part '../blocs/category_bloc/category_event.dart';
part '../blocs/category_bloc/category_state.dart';

part '../blocs/currency_bloc/currency_bloc.dart';
part '../blocs/currency_bloc/currency_event.dart';
part '../blocs/currency_bloc/currency_state.dart';


part '../blocs/expenses_bloc/expenses_bloc.dart';
part '../blocs/expenses_bloc/expenses_event.dart';
part '../blocs/expenses_bloc/expenses_state.dart';