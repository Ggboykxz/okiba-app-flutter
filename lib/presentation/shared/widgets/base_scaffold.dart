import 'package:flutter/material.dart';
import '../wrappers/connectivity_wrapper.dart';
import 'bottom_nav_bar.dart';
import 'app_bar_okiba.dart';

class BaseScaffold extends StatelessWidget {
  final String? title;
  final bool showLogo;
  final bool showBack;
  final bool showSearch;
  final bool showCart;
  final bool showNotifications;
  final bool showBottomNav;
  final bool showFab;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final AppBarStyle appBarStyle;
  final int cartItemCount;
  final int notificationCount;
  final AppNavTab? currentTab;
  final ValueChanged<AppNavTab>? onTabSelected;
  final VoidCallback? onSearchTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onFabTap;
  final Color? backgroundColor;

  const BaseScaffold({
    super.key,
    this.title,
    this.showLogo = false,
    this.showBack = false,
    this.showSearch = false,
    this.showCart = false,
    this.showNotifications = false,
    this.showBottomNav = false,
    this.showFab = false,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.appBarStyle = AppBarStyle.opaque,
    this.cartItemCount = 0,
    this.notificationCount = 0,
    this.currentTab,
    this.onTabSelected,
    this.onSearchTap,
    this.onCartTap,
    this.onNotificationTap,
    this.onFabTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarOkiba(
        title: title,
        showLogo: showLogo,
        showBack: showBack,
        showSearch: showSearch,
        showCart: showCart,
        showNotifications: showNotifications,
        cartItemCount: cartItemCount,
        notificationCount: notificationCount,
        onSearchTap: onSearchTap,
        onCartTap: onCartTap,
        onNotificationTap: onNotificationTap,
        style: appBarStyle,
      ),
      body: ConnectivityWrapper(child: body),
      bottomNavigationBar: showBottomNav
          ? (bottomNavigationBar ??
              (currentTab != null && onTabSelected != null
                  ? BottomNavBar(
                      currentTab: currentTab!,
                      onTabSelected: onTabSelected!,
                      cartItemCount: cartItemCount,
                    )
                  : null))
          : bottomNavigationBar,
      floatingActionButton: showFab
          ? (floatingActionButton ??
              (onFabTap != null
                  ? FloatingActionButton(
                      onPressed: onFabTap,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.add, size: 28),
                    )
                  : null))
          : floatingActionButton,
    );
  }
}
