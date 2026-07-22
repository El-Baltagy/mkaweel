part of '../project_invoices_screen.dart';

class _InvoiceListItem extends StatelessWidget {
  const _InvoiceListItem({
    required this.item,
    required this.isDark,
  });

  final InvoiceItem item;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppPadding.p12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.invoice_number,
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                ),
                child: Text(
                  '${item.amount} SAR',
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: AppColors.primaryLightColor,
                  ),
                ),
              ),
            ],
          ),
          AppPadding.p12.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
              AppPadding.p8.horizontalSpace,
              Text(
                item.invoice_date,
                style: AppTextStyles.font14Regular.copyWith(
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
            ],
          ),
          AppPadding.p8.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.category_outlined,
                size: 16,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
              AppPadding.p8.horizontalSpace,
              Expanded(
                child: Text(
                  item.category_details.name,
                  style: AppTextStyles.font14Regular.copyWith(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (item.notes.isNotEmpty) ...[
            AppPadding.p12.verticalSpace,
            Text(
              item.notes,
              style: AppTextStyles.font14Regular.copyWith(
                color: isDark ? Colors.grey[300] : Colors.grey[800],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
