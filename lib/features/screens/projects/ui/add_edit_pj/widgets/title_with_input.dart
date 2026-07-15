import 'package:flutter/Material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/base_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

class TitleWithInputField extends StatelessWidget {
  const TitleWithInputField(this.mainLabel,   this.data, {super.key});

  final String mainLabel;
  final  BaseTextInputData  data;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              mainLabel,
              style: AppTextStyles.font14Regular.copyWith(
                color: context.theme.colorScheme.tertiaryFixed,
              ),
            ),
            if( data.enableValidation && data.field != null)
              ...[
                const SizedBox(width: AppSizes.s4),
                Text('*',
                    style: AppTextStyles.font14Regular
                        .copyWith(color: AppColors.secondryLightColor)),
              ]
          ],
        ),
        10.verticalSpace,
        TextInputWidget(data: data),
      ],
    );
  }
}