part of 'workers_widgets.dart';
class EmptyWorkersWidget extends StatelessWidget {
  const EmptyWorkersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.group_outlined, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: AppSizes.s16),
          Text(
            'no_workers'.tr(),
            style: AppTextStyles.font18SemiBold.copyWith(color: Colors.grey.shade500),
          ),
          const SizedBox(height: AppSizes.s8),
          Text(
            'press_to_add_worker'.tr(),
            style: AppTextStyles.font14Regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}