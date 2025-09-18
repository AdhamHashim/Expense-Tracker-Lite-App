import 'package:injectable/injectable.dart';

import '../../../config/res/config_imports.dart';
import 'setup_service_locators.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void setUpServiceLocator() => injector.init();
