part of '../project_invoices_screen.dart';

class _InvoiceListItem extends StatelessWidget {
  const _InvoiceListItem({
    required this.item,
    required this.isDark,
    required this.budgetsummary,
    this.projectsCubit,
  });

  final InvoiceItem item;
  final Budgetsummary budgetsummary;
  final bool isDark;
  final ProjectsCubit? projectsCubit;

  @override
  Widget build(BuildContext context) {
    final cubit = projectsCubit ?? ProjectsCubit.get(context: context);
    final deleteTaskState = cubit.current.deleteTaskState;
    final isDeleting = deleteTaskState is Loading && deleteTaskState.item == item.id.toString();

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
            children: [
              Expanded(
                child: Text(
                  item.invoice_number,
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () => context.push( InvoiceRoute(args: .new(null,(item,budgetsummary) ) )),
              //   child: Icon(
              //     Icons.edit,
              //     color: context.theme.primaryColor,
              //   ),
              // ),
              // 5.horizontalSpace,
              if (isDeleting)
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              else
                GestureDetector(
                  onTap: DeletePjDialouge(
                    title: 'delete_invoice'.tr(),
                    subTitle: 'are_you_sure_you_want_to_delete_this_invoice'.tr(),
                    onPressedDelete: () => cubit.deleteInvoiceFunc(
                      parameter: DeleteProjectParameter(item.id.toString()),
                    ),
                  ).toShowDialouge,
                  child: Icon(
                    Icons.delete,
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
            ],
          ),
          AppPadding.p10.verticalSpace,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                ),
                child: Text(
                  '${item.amount} ${budgetsummary.currency}',
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: AppColors.primaryLightColor,
                  ),
                ),
              ),
            ],
          ),
          AppPadding.p10.verticalSpace,
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
          if (item.notes?.trim().isNotEmpty == true) ...[
            AppPadding.p12.verticalSpace,
            Text(
              item.notes!,
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