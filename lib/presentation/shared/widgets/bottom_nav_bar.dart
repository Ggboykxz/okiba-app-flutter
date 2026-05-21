import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
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

class BottomNavBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: AppSpacing.bottomNavHeight,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: AppNavTab.values.indexOf(currentTab),
            onTap: (index) => onTabSelected(AppNavTab.values[index]),
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
              final isSelected = tab == currentTab;
              final icon = tab == AppNavTab.cart && cartItemCount > 0
                  ? Badge(
                      label: Text(
                        cartItemCount.toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                      child: OkibaIcon(
                        name: tab.iconName,
                        category: IconCategory.tab,
                        filled: isSelected,
                        color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                      ),
                    )
                  : OkibaIcon(
                      name: tab.iconName,
                      category: IconCategory.tab,
                      filled: isSelected,
                      color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                    );
              return BottomNavigationBarItem(icon: icon, label: tab.label);
            }).toList(),
          ),
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: FloatingActionButton(
                  onPressed: () => onTabSelected(AppNavTab.sell),
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  elevation: 4,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add, size: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
