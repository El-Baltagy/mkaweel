part of '../main_home_screen.dart';

class Testtt extends StatelessWidget {
  const Testtt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.tabsRouter, required this.routesNav});
  final TabsRouter tabsRouter;
  final List<_NavItemData> routesNav;

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   routesNav.map((e) => e.route).toList()
            // RTL: index 0 is rightmost (الرئيسية)
            children: List.generate(routesNav.length, (i) {
              final isActive = tabsRouter.activeIndex == i;
              return _NavItem(
                data: routesNav[i],
                isActive: isActive,
                onTap: () => tabsRouter.setActiveIndex(i),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  const _NavItemData({required this.icon, required this.route,required this.label});
  final IconData icon;
  final String label;
  final PageRouteInfo  route;
}

class _NavItem extends StatelessWidget {

  const _NavItem({
    required this.data,
    required this.isActive,
    required this.onTap,
  });
  final _NavItemData data;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.contractorTeal : const Color(0xFFADB5BD);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 68,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Active indicator line at top
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3,
              width: isActive ? 36 : 0,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                color: AppColors.contractorTeal,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Icon(data.icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              data.label,
              style: AppTextStyles.font12Regular.copyWith(
                color: color,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}