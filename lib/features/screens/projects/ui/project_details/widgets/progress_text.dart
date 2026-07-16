import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';

class ProgressRow extends StatelessWidget {
  const ProgressRow({
    super.key,
    required this.projectPhaseItem,
    required this.isCompleted,
  });

  final ProjectphaseItem projectPhaseItem;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('progress_percentage'.tr(), style: AppTextStyles.font12Regular),
        AppPadding.p8.horizontalSpace,
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.s4),
            child:   LinearProgressIndicator(
              value:(projectPhaseItem.progress_percentage /100).toDouble() ,
              backgroundColor: AppColors.lightBorder,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryLightColor,
              ),
              minHeight: AppSizes.s8,
            ),
          ),
        ),

        AppPadding.p8.horizontalSpace,
        Text(
          '${projectPhaseItem.progress_percentage} %',
          style: AppTextStyles.font12Regular.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.lightTextPrimary,
          ),
        ),

        AppPadding.p12.horizontalSpace,
        ProgressTitle(value:projectPhaseItem.progress_percentage.toDouble()),
      ],
    );
  }

}

class ProgressTitle extends StatelessWidget {
  const ProgressTitle({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
     String   _statusKey (){
        if (value == 0) return 'pending_status';
        if (value >= 100) return 'completed_status';
        return 'in_progress_status';
      }
     Color   containerColor (){
       if (value == 0) return AppColors.lightSurface;
       if (value >= 100) return context.theme.primaryColor;
       return context.theme.canvasColor;
     }
     Color   txtColor (){
       if (value == 0) return AppColors.lightTextPrimary;
       if (value >= 100) return context.theme.scaffoldBackgroundColor;
       return AppColors.primaryLightColor;
     }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p4,
      ),
      decoration: BoxDecoration(
        color: containerColor() ,
        // color: isCompleted?
        // context.theme.primaryColor:
        // AppColors.lightSurface,
        borderRadius: BorderRadius.circular(AppSizes.s4),
        border: Border.all(color: txtColor() ),
      ),
      child: Text(
        _statusKey().tr(),
        style: AppTextStyles.font12Regular.copyWith(
          color:txtColor()
        ),
      ),
    );
  }

}