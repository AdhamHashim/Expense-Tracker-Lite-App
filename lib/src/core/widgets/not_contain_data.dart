import 'package:flutter/material.dart';
import '../../config/language/locale_keys.g.dart';
import '../../config/res/assets.gen.dart';
import '../../config/res/config_imports.dart';
import '../extensions/text_style_extensions.dart';

class NotContainData extends StatelessWidget {
  final double? width, height;
  const NotContainData({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppMargin.mH20,
      children: [
        AppAssets.lottie.data.notFound2.lottie(),
        Text(
          LocaleKeys.errorExceptionNotContain,
          style: const TextStyle().setMainTextColor.s14.medium,
        ),
      ],
    );
  }
}
