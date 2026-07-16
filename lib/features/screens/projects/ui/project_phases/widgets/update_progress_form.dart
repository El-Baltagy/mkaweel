part of '../phase_progress_screen.dart';

class _ProgressPercentageField extends StatelessWidget {
  const _ProgressPercentageField(this.progressValue);
  final ValueNotifier<double>   progressValue ;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable:progressValue , builder: (context, value, child) {
      String   _statusKey (){
        if (value == 0) return 'pending_status';
        if (value >= 100) return 'completed_status';
        return 'in_progress_status';
      }
      //
      Color   statusColor (){
        if (value == 0) return AppColors.lightTextPrimary;
        if (value >= 100) return Colors.green;
        return AppColors.primaryLightColor;
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Label row ────────────────────────────────────────────
          RichText(
            text: TextSpan(
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.lightTextPrimary,
              ),
              children: [
                TextSpan(
                  text: '${'progress_percentage_label'.tr()} '+'(',
                ),
                TextSpan(
                  text: '${value.toInt()}%',
                  style: AppTextStyles.font14Regular.copyWith(
                    color: context.theme.primaryColor, // Change to your desired color/style
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ')',
                ),
              ],
            ),
          ),

          AppPadding.p8.verticalSpace,
          // ── Slider + status ──────────────────────────────────────
          Row(
            children: [

              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primaryLightColor,
                    inactiveTrackColor: AppColors.lightBorder,
                    thumbColor: AppColors.primaryLightColor,
                    overlayColor:
                    AppColors.primaryLightColor.withOpacity(0.15),
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: value,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: '${value.toInt()}%',
                    onChanged: (v) => progressValue.value=v,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.s8),
              // ── Percentage + status badge ────────────────────────
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: statusColor().withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppSizes.s4),
                  border: Border.all(color: statusColor().withOpacity(0.4)),
                ),
                child: Text(
                  _statusKey().tr(),
                  style: AppTextStyles.font12Regular
                      .copyWith(color: statusColor()),
                ),
              ),
            ],
          ),
        ],
      );
    },);
  }
}
