part of '../project_phase_update_screen.dart';

/// A single entry in the progress history timeline.
class _ProgressHistoryItem extends StatelessWidget {
  const _ProgressHistoryItem({
    required this.item,
    required this.isLast,
    required this.isDark,
  });

  final ProgressupdateItem item;
  final bool isLast;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.theme.primaryColor;
    final cardColor = isDark ? AppColors.darkSurface : Colors.white;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final textPrimary =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    final percentage = item.progress_percentage.clamp(0, 100);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Timeline track (dot + vertical line) ──────────────────
          SizedBox(
            width: 24,
            child: Column(
              children: [
                // Dot
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.35),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                // Vertical line
                if (!isLast)
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              primaryColor.withOpacity(0.6),
                              primaryColor.withOpacity(0.08),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          AppPadding.p12.horizontalSpace,

          // ── Card ──────────────────────────────────────────────────
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: AppPadding.p20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(AppSizes.s12),
                border: Border.all(color: borderColor),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.25)
                        : const Color(0x0A000000),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Header row ──────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppPadding.p14,
                      AppPadding.p12,
                      AppPadding.p14,
                      0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Percentage badge
                        _PercentageBadge(
                          percentage: percentage,
                          primaryColor: primaryColor,
                        ),
                        AppPadding.p10.horizontalSpace,

                        // Date label
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                size: 13,
                                color: textSecondary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${'update_date_label'.tr()}: ',
                                style: AppTextStyles.font12Regular.copyWith(
                                  color: textSecondary,
                                ),
                              ),
                              if(item.update_date!=null)
                              Flexible(
                                child: Text(
                                  item.update_date!,
                                  style: AppTextStyles.font12Regular.copyWith(
                                    color: textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Progress bar + creator
                        _ProgressBarWithLabel(
                          percentage: percentage,
                          primaryColor: primaryColor,
                        ),
                        AppPadding.p8.horizontalSpace,
                        if(item.creator_name!=null)
                        _CreatorChip(
                          name: item.creator_name!,
                          textSecondary: textSecondary,
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),

                  // ── Notes / description ─────────────────────────
                  if (item.notes?.trim().isNotEmpty==true) ...[
                    AppPadding.p10.verticalSpace,
                    _NotesBox(
                      notes: item.notes!,
                      isDark: isDark,
                      textPrimary: textPrimary,
                    ),
                  ],

                  // ── Photo gallery ───────────────────────────────
                  if (item.photos?.isNotEmpty==true) ...[
                    AppPadding.p10.verticalSpace,
                    _PhotoGallery(photos: item.photos!),
                  ],

                  AppPadding.p12.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Sub-widgets
// ──────────────────────────────────────────────────────────────────────────────

/// Teal percentage pill badge (e.g. "90%")
class _PercentageBadge extends StatelessWidget {
  const _PercentageBadge({
    required this.percentage,
    required this.primaryColor,
  });

  final int percentage;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p10,
        vertical: AppPadding.p4,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.s8),
      ),
      child: Text(
        '$percentage%',
        style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Inline mini progress bar (matching the web design's short line indicator)
class _ProgressBarWithLabel extends StatelessWidget {
  const _ProgressBarWithLabel({
    required this.percentage,
    required this.primaryColor,
  });

  final int percentage;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: primaryColor.withOpacity(0.15),
          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          minHeight: 5,
        ),
      ),
    );
  }
}

/// Creator name chip with person icon
class _CreatorChip extends StatelessWidget {
  const _CreatorChip({
    required this.name,
    required this.textSecondary,
    required this.isDark,
  });

  final String name;
  final Color textSecondary;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.person_outline_rounded,
          size: 13,
          color: textSecondary,
        ),
        const SizedBox(width: 3),
        Text(
          name,
          style: AppTextStyles.font12Regular.copyWith(
            color: textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Grey notes/description box
class _NotesBox extends StatelessWidget {
  const _NotesBox({
    required this.notes,
    required this.isDark,
    required this.textPrimary,
  });

  final String notes;
  final bool isDark;
  final Color textPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p10,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkBorder.withOpacity(0.5)
            : const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(AppSizes.s8),
      ),
      child: Text(
        notes,
        style: AppTextStyles.font14Regular.copyWith(
          color: textPrimary,
          height: 1.55,
        ),
        textDirection:  .rtl,
      ),
    );
  }
}
