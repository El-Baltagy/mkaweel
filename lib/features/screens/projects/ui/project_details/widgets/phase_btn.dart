part of '../project_details_screen.dart';
class BuildPhaseBtn extends StatelessWidget {
  const BuildPhaseBtn({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
      this.style,
  });

  // final ProjectphaseItem projectPhaseItem;
  // final ProjectsCubit projectsCubit;

  final void Function()? onPressed;
  final IconData? icon;
  final String title;
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.s48,
      child: ElevatedButton.icon(
        onPressed:onPressed ,
        icon:   Icon(
          icon,
           size: AppSizes.s18,
        ),
        label: Text(
            title
         ),
        style:style??
        OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLightColor,
          side: const BorderSide(color: AppColors.primaryLightColor),
          textStyle: AppTextStyles.font14Regular.copyWith(
            color: AppColors.primaryLightColor,
          ),
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.s8),
          ),
        ),
      ),
    );
  }
}