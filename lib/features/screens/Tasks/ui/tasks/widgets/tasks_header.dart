// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:mkaweel/core/extension/double.dart';
// import 'package:mkaweel/core/theming/app_colors.dart';
// import 'package:mkaweel/core/theming/app_text_styles.dart';
// import 'package:mkaweel/core/theming/app_values.dart';
//
// class TasksHeader extends StatelessWidget {
//   const TasksHeader({super.key, required this.onAddTask});
//
//   final VoidCallback onAddTask;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: AppPadding.p20,
//         vertical: AppPadding.p16,
//       ),
//       color: AppColors.lightBackground,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'all_construction_tasks'.tr(),
//                   style: AppTextStyles.font16SemiBold.copyWith(
//                     color: AppColors.lightTextPrimary,
//                   ),
//                 ),
//                 AppPadding.p4.verticalSpace,
//                 Text(
//                   'schedule_active_operations'.tr(),
//                   style: AppTextStyles.font12Regular.copyWith(
//                     color: AppColors.lightTextSecondary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           InkWell(
//             onTap: onAddTask,
//             borderRadius: BorderRadius.circular(AppSizes.s20),
//             child: Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppPadding.p16,
//                 vertical: AppPadding.p8,
//               ),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryLightColor,
//                 borderRadius: BorderRadius.circular(AppSizes.s20),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(
//                     Icons.add,
//                     color: AppColors.lightBackground,
//                     size: AppSizes.s16,
//                   ),
//                   AppPadding.p4.horizontalSpace,
//                   Text(
//                     'add_task'.tr(),
//                     style: AppTextStyles.font14Regular.copyWith(
//                       color: AppColors.lightBackground,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
