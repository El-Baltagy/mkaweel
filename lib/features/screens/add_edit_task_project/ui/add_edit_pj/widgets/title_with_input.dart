import 'package:flutter/Material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/base_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';

class TitleWithInputField extends StatelessWidget {
  const TitleWithInputField(this.mainLabel, this.data, {super.key});

  final String mainLabel;
  final  BaseTextInputData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainLabel,
          style: AppTextStyles.font14Regular.copyWith(
            color: context.theme.colorScheme.tertiaryFixed,
          ),
        ),
        10.verticalSpace,
        TextInputWidget(data: data),
      ],
    );
  }
}