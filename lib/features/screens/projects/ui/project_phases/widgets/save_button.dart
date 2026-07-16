part of '../phase_progress_screen.dart';

class _SavePhaseDatesButton extends StatelessWidget {
  const _SavePhaseDatesButton(this.title, this.onPressed, {required this.isLoading});

  final String title;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: AppSizes.s48,
      child: isLoading?
      Row(
        mainAxisAlignment: .center,
        children: [
          CircularProgressIndicator(),
        ],
      ):
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLightColor,
          foregroundColor: AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.s8),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.font16SemiBold
              .copyWith(color: AppColors.lightBackground),
        ),
      ),
    );
  }
}