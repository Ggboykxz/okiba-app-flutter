import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_animations.dart';
import '../../../core/utils/haptics.dart';
import '../../../core/widgets/okiba_icon.dart';

enum AppNavTab {
  home('home', 'Accueil'),
  search('search', 'Recherche'),
  sell('sell', 'Vendre'),
  cart('cart', 'Panier'),
  profile('profile', 'Profil');

  final String iconName;
  final String label;

  const AppNavTab(this.iconName, this.label);
}

class BottomNavBar extends StatefulWidget {
  final AppNavTab currentTab;
  final ValueChanged<AppNavTab> onTabSelected;
  final int cartItemCount;

  const BottomNavBar({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
    this.cartItemCount = 0,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: AppAnimations.ambient,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _onTap(AppNavTab tab) {
    AppHaptics.tabChange();
    widget.onTabSelected(tab);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space16,
        vertical: AppSpacing.space16,
      ),
      height: AppSpacing.bottomNavHeight,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceGlassDark : AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(AppSpacing.radius24),
        border: Border.all(
          color: isDark
              ? AppColors.surfaceGlassBorderDark
              : AppColors.surfaceGlassBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColors.accentGlowDark : AppColors.accentGlow,
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radius24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BottomNavigationBar(
              currentIndex: AppNavTab.values.indexOf(widget.currentTab),
              onTap: (index) => _onTap(AppNavTab.values[index]),
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: colorScheme.primary,
              unselectedItemColor: colorScheme.onSurfaceVariant,
              selectedLabelStyle: const TextStyle(
                fontSize: AppSpacing.textXs,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: AppSpacing.textXs,
                fontWeight: FontWeight.w500,
              ),
              items: AppNavTab.values.map((tab) {
                final isSelected = tab == widget.currentTab;
                final icon = tab == AppNavTab.cart && widget.cartItemCount > 0
                    ? Badge(
                        label: Text(
                          widget.cartItemCount.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                        child: OkibaIcon(
                          name: tab.iconName,
                          category: IconCategory.tab,
                          filled: isSelected,
                          color: isSelected
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                        ),
                      )
                    : OkibaIcon(
                        name: tab.iconName,
                        category: IconCategory.tab,
                        filled: isSelected,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                      );
                return BottomNavigationBarItem(icon: icon, label: tab.label);
              }).toList(),
            ),
            Positioned(
              top: -28,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 + (_pulseController.value * 0.02),
                      child: child,
                    );
                  },
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: FloatingActionButton(
                      onPressed: () => _onTap(AppNavTab.sell),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      elevation: 4,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.add, size: 28),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
