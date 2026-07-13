part of '../phase_progress_screen.dart';

class _PhaseInformationSection extends StatefulWidget {
  const _PhaseInformationSection();

  @override
  State<_PhaseInformationSection> createState() =>
      _PhaseInformationSectionState();
}

class _PhaseInformationSectionState extends State<_PhaseInformationSection> {
  DateTime? _plannedStart = DateTime(2026, 7, 7);
  DateTime? _plannedEnd = DateTime(2026, 7, 7);
  DateTime? _actualStart;
  DateTime? _actualEnd;

  /// Opens a date picker and calls [onPicked] with the result.
  Future<void> _pickDate(
      BuildContext context, DateTime? initial, void Function(DateTime) onPicked) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryLightColor,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) onPicked(picked);
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'mm/dd/yyyy';
    return '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'phase_information'.tr(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'phase_information'.tr(),
            style: AppTextStyles.font18SemiBold,
          ),
          AppPadding.p16.verticalSpace,

          // Planned Start Date
          _DatePickerField(
            label: 'planned_start_date'.tr(),
            value: _formatDate(_plannedStart),
            onTap: () => _pickDate(
              context,
              _plannedStart,
              (d) => setState(() => _plannedStart = d),
            ),
          ),

          AppPadding.p12.verticalSpace,

          // Planned End Date
          _DatePickerField(
            label: 'planned_end_date'.tr(),
            value: _formatDate(_plannedEnd),
            onTap: () => _pickDate(
              context,
              _plannedEnd,
              (d) => setState(() => _plannedEnd = d),
            ),
          ),

          AppPadding.p12.verticalSpace,

          // Actual Start Date
          _DatePickerField(
            label: 'actual_start_date'.tr(),
            value: _formatDate(_actualStart),
            onTap: () => _pickDate(
              context,
              _actualStart,
              (d) => setState(() => _actualStart = d),
            ),
          ),

          AppPadding.p12.verticalSpace,

          // Actual End Date
          _DatePickerField(
            label: 'actual_end_date'.tr(),
            value: _formatDate(_actualEnd),
            onTap: () => _pickDate(
              context,
              _actualEnd,
              (d) => setState(() => _actualEnd = d),
            ),
          ),

          AppPadding.p20.verticalSpace,

          // Save Phase Dates button
          _SavePhaseDatesButton(),
        ],
      ),
    );
  }
}

class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.font14Regular
                .copyWith(color: AppColors.lightTextPrimary),
          ),
          AppPadding.p8.verticalSpace,
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p14,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                border: Border.all(color: AppColors.lightBorder),
                color: AppColors.lightBackground,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: AppTextStyles.font14Regular
                        .copyWith(color: AppColors.lightTextPrimary),
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.primaryLightColor,
                    size: AppSizes.s20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SavePhaseDatesButton extends StatelessWidget {
  const _SavePhaseDatesButton();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'save_phase_dates'.tr(),
      button: true,
      child: SizedBox(
        width: double.infinity,
        height: AppSizes.s48,
        child: ElevatedButton(
          onPressed: () {
            // TODO: save phase dates
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryLightColor,
            foregroundColor: AppColors.lightBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.s8),
            ),
          ),
          child: Text(
            'save_phase_dates'.tr(),
            style: AppTextStyles.font16SemiBold
                .copyWith(color: AppColors.lightBackground),
          ),
        ),
      ),
    );
  }
}
