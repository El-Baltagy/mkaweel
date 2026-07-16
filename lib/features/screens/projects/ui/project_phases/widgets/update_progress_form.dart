part of '../phase_progress_screen.dart';

class _ProgressPercentageField extends StatelessWidget {
  const _ProgressPercentageField(this.progressValue);
  final ValueNotifier<double>   progressValue ;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable:progressValue , builder: (context, value, child) {

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
              ProgressTitle(value:value)
            ],
          ),
        ],
      );
    },);
  }
}
