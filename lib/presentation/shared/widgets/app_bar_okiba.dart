import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/okiba_logo.dart';

enum AppBarStyle { transparent, opaque, search }

class AppBarOkiba extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLogo;
  final bool showBack;
  final bool showSearch;
  final bool showCart;
  final bool showNotifications;
  final int cartItemCount;
  final int notificationCount;
  final VoidCallback? onSearchTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onNotificationTap;
  final List<Widget>? actions;
  final Widget? leading;
  final AppBarStyle style;

  const AppBarOkiba({
    super.key,
    this.title,
    this.showLogo = false,
    this.showBack = false,
    this.showSearch = false,
    this.showCart = false,
    this.showNotifications = false,
    this.cartItemCount = 0,
    this.notificationCount = 0,
    this.onSearchTap,
    this.onCartTap,
    this.onNotificationTap,
    this.actions,
    this.leading,
    this.style = AppBarStyle.opaque,
  });

  @override
  Size get preferredSize => const Size.fromHeight(AppSpacing.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: style == AppBarStyle.transparent ? 0 : 2,
      backgroundColor: style == AppBarStyle.transparent
          ? Colors.transparent
          : Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: colorScheme.onSurface,
      centerTitle: false,
      toolbarHeight: AppSpacing.appBarHeight,
      automaticallyImplyLeading: showBack,
      leading: leading,
      title: showLogo
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OkibaLogo(variant: LogoVariant.mark, size: LogoSize.sm),
                const SizedBox(width: 8),
                Text(
                  'OKIBA',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          : (title != null
              ? Text(title!, style: theme.textTheme.titleLarge)
              : null),
      actions: [
        if (showSearch)
          IconButton(
            icon: const Icon(Icons.search, size: 24),
            onPressed: onSearchTap,
            tooltip: 'Rechercher',
          ),
        if (showNotifications)
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, size: 24),
                onPressed: onNotificationTap,
                tooltip: 'Notifications',
              ),
              if (notificationCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      notificationCount > 99 ? '99+' : '$notificationCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        if (showCart)
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, size: 24),
                onPressed: onCartTap,
                tooltip: 'Panier',
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '$cartItemCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        if (actions != null) ...actions!,
      ],
    );
  }
}
