part of '../phase_progress_screen.dart';

class _ProgressPercentageField extends StatelessWidget {
  const _ProgressPercentageField();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'progress_percentage_label'.tr(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'progress_percentage_label'.tr(),
                style: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.lightTextPrimary),
              ),
              const SizedBox(width: AppSizes.s4),
              Text('*',
                  style: AppTextStyles.font14Regular
                      .copyWith(color: AppColors.secondryLightColor)),
            ],
          ),
          AppPadding.p8.verticalSpace,
          TextFormField(
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            initialValue: '0.00',
            style: AppTextStyles.font16SemiBold,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                borderSide:
                    const BorderSide(color: AppColors.lightBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                borderSide:
                    const BorderSide(color: AppColors.lightBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                borderSide:
                    const BorderSide(color: AppColors.primaryLightColor, width: AppSizes.s2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusDropdownField extends StatefulWidget {
  const _StatusDropdownField();

  @override
  State<_StatusDropdownField> createState() => _StatusDropdownFieldState();
}

class _StatusDropdownFieldState extends State<_StatusDropdownField> {
  String _selected = 'pending_status';

  @override
  Widget build(BuildContext context) {
    final statuses = [
      'pending_status',
      'in_progress_status',
      'completed_status',
    ];
    return Semantics(
      label: 'status_label'.tr(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'status_label'.tr(),
            style: AppTextStyles.font14Regular
                .copyWith(color: AppColors.lightTextPrimary),
          ),
          AppPadding.p8.verticalSpace,
          DropdownButtonFormField<String>(
            value: _selected,
            style: AppTextStyles.font14Regular
                .copyWith(color: AppColors.lightTextPrimary),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                borderSide:
                    const BorderSide(color: AppColors.lightBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                borderSide:
                    const BorderSide(color: AppColors.lightBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                borderSide: const BorderSide(
                    color: AppColors.primaryLightColor, width: AppSizes.s2),
              ),
            ),
            items: statuses
                .map((s) => DropdownMenuItem(
                      value: s,
                      child: Text(s.tr()),
                    ))
                .toList(),
            onChanged: (val) {
              if (val != null) setState(() => _selected = val);
            },
          ),
        ],
      ),
    );
  }
}

class _UpdateDateField extends StatelessWidget {
  const _UpdateDateField();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'update_date_label'.tr(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'update_date_label'.tr(),
                style: AppTextStyles.font14Regular
                    .copyWith(color: AppColors.lightTextPrimary),
              ),
              const SizedBox(width: AppSizes.s4),
              Text('*',
                  style: AppTextStyles.font14Regular
                      .copyWith(color: AppColors.secondryLightColor)),
            ],
          ),
          AppPadding.p8.verticalSpace,
          TextFormField(
            readOnly: true,
            initialValue: DateTime.now()
                .toIso8601String()
                .substring(0, 10),
            style: AppTextStyles.font14Regular
                .copyWith(color: AppColors.lightTextPrimary),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p14,
              ),
              suffixIcon: const Icon(
                Icons.calendar_today_outlined,
                color: AppColors.primaryLightColor,
                size: AppSizes.s20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                borderSide:
                    const BorderSide(color: AppColors.lightBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                borderSide:
                    const BorderSide(color: AppColors.lightBorder),
              ),
            ),
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
                builder: (context, child) => Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: AppColors.primaryLightColor,
                    ),
                  ),
                  child: child!,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



class _UploadPhotosSection extends StatelessWidget {
  const _UploadPhotosSection();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'upload_progress_photos'.tr(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'upload_progress_photos'.tr(),
            style: AppTextStyles.font14Regular
                .copyWith(color: AppColors.primaryLightColor, fontWeight: FontWeight.w600),
          ),
          AppPadding.p8.verticalSpace,
          GestureDetector(
            onTap: () {
              // TODO: implement image picker
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p14,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                border: Border.all(color: AppColors.lightBorder),
                color: AppColors.lightSurface,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12, vertical: AppPadding.p8),
                    decoration: BoxDecoration(
                      color: AppColors.lightBorder,
                      borderRadius: BorderRadius.circular(AppSizes.s4),
                    ),
                    child: Text(
                      'choose_files'.tr(),
                      style: AppTextStyles.font12Regular
                          .copyWith(color: AppColors.lightTextPrimary),
                    ),
                  ),
                  AppPadding.p12.horizontalSpace,
                  Text(
                    'no_file_chosen'.tr(),
                    style: AppTextStyles.font12Regular,
                  ),
                ],
              ),
            ),
          ),
          AppPadding.p4.verticalSpace,
          Text(
            'photos_hint'.tr(),
            style: AppTextStyles.font12Regular,
          ),
        ],
      ),
    );
  }
}


