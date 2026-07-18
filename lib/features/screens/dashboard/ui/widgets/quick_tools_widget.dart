import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/widgets/ticker_text.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/double.dart';

import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/features/screens/dashboard/controller/dashboard_cubit.dart';
import 'package:mkaweel/features/screens/dashboard/ui/weather/weather_screen.dart';

class ItemGridData {
  ItemGridData({
     required this.label,
     required this.icon,
    required this.bgColor,
    required this.iconColor,

      this.onTap,
      this.routeNavigation,
});
  final String label;
  final IconData icon;
  final Color bgColor, iconColor;
  final VoidCallback? onTap;
  final PageRouteInfo<dynamic>? routeNavigation;

}

class QuickToolsWidget extends StatelessWidget {
  const QuickToolsWidget({super.key, required this.dashboardCubit });
  final DashboardCubit   dashboardCubit;
  @override
  Widget build(BuildContext context) {

    final List<ItemGridData>list=[
      ItemGridData(label: 'gantt_chart'.tr(), icon: Icons.format_list_bulleted,
          bgColor: Colors.indigo.shade100, iconColor: Colors.indigo,routeNavigation:   GanttChartRoute(
            args: .new(dashboardCubit)
          )),
      ItemGridData(label: 'waste_calculator'.tr(), icon: Icons.calculate_outlined,
          bgColor: Colors.orange.shade100, iconColor: Colors.orange,routeNavigation:
          WasteCalculatorRoute(
            args: WasteCalculatorRouteArgs(dashboardCubit),
          )),
      ItemGridData(label: 'weather'.tr(), icon: Icons.cloud_outlined,
          routeNavigation: WeatherRoute(args: .new(
              dashboardCubit
          ) ),
          bgColor: Colors.blue.shade100, iconColor: Colors.blue ),
      ItemGridData(label: 'attendance_registration'.tr(), icon: Icons.how_to_reg,
          bgColor: Colors.teal.shade100, iconColor: Colors.teal ),
      ItemGridData(label: 'suppliers'.tr(), icon: Icons.inventory_2_outlined,
          routeNavigation: SuppliersInfoRoute(args: SuppliersInfoRouteArgs()),

          bgColor: Colors.green.shade100, iconColor: Colors.green )  ,

      ItemGridData(label: 'new_invoice'.tr(), icon: Icons.receipt_long,
           bgColor: Colors.green.shade100, iconColor: Theme.of(context).primaryColor)

    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('quick_tools'.tr(), style: AppTextStyles.font16SemiBold),
          10.verticalSpace,
          GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1,
              children:list.map((e) =>_buildToolItem(context,e.label, e.icon, e.bgColor, e.iconColor,
                onTap: e.onTap??(e.routeNavigation==null?null:
                    () => context.push(  e.routeNavigation!)),
              )).toList()

          ),
        ],
      ),
    );

  }


  // Widget _buildLinkItem(BuildContext context,String label, IconData icon, Color bgColor, Color iconColor,{    VoidCallback? onTap,}) {
  //   return Padding(
  //     padding:      .only(bottom:AppPadding.p12 ),
  //     child: GestureDetector(
  //       onTap: onTap ,
  //       child: Container(
  //
  //         padding: const  .all(AppPadding.p16),
  //          decoration: BoxDecoration(
  //           color: context.theme.scaffoldBackgroundColor,
  //           borderRadius: BorderRadius.circular(AppSizes.s12),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black.withOpacity(0.08),
  //               blurRadius: 5,
  //               offset: const Offset(0, 2),
  //             ),
  //           ],
  //         ),
  //         child: Row(
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.all(AppPadding.p8),
  //               decoration: BoxDecoration(
  //                 color: bgColor.withOpacity(0.5),
  //                 borderRadius: BorderRadius.circular(AppSizes.s8),
  //               ),
  //               child: Icon(icon, color: iconColor),
  //             ),
  //             10.horizontalSpace,
  //             Container(
  //               constraints: BoxConstraints(
  //                 maxWidth: context.width * 0.6,
  //               ),
  //               child: TickerText(
  //                 child: Text(
  //                   label,
  //                   style: AppTextStyles.font14Regular.copyWith(fontWeight: FontWeight.bold, color: context.theme.colorScheme.tertiaryFixed),
  //                 ),
  //               ),
  //             ),
  //
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildToolItem(
      BuildContext context,
      String label,
      IconData icon,
      Color bgColor,
      Color iconColor, {
        VoidCallback? onTap,
      }) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.s12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: bgColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(AppSizes.s8),
              ),
              child: Icon(icon, color: iconColor),
            ),
            10.verticalSpace,
            Container(
              constraints: BoxConstraints(
                maxWidth: context.width * 0.6,
              ),
              child: TickerText(
                child: Text(
                  label,
                  style: AppTextStyles.font12Regular.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.tertiaryFixed,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
