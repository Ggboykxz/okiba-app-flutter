import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/haptics.dart';
import '../../../core/widgets/okiba_logo.dart';

enum AppBarStyle { transparent, opaque, search }

class AppBarOkiba extends StatefulWidget implements PreferredSizeWidget {
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
  State<AppBarOkiba> createState() => _AppBarOkibaState();
}

class _AppBarOkibaState extends State<AppBarOkiba> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrolled = _scrollController.position.pixels > 20;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final showGlass = _isScrolled && widget.style == AppBarStyle.opaque;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          _onScroll();
        }
        return false;
      },
      child: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: showGlass
            ? (isDark ? AppColors.surfaceGlassDark : AppColors.surfaceGlass)
            : (widget.style == AppBarStyle.transparent
                ? Colors.transparent
                : Theme.of(context).scaffoldBackgroundColor),
        foregroundColor: colorScheme.onSurface,
        centerTitle: false,
        toolbarHeight: AppSpacing.appBarHeight,
        automaticallyImplyLeading: widget.showBack,
        leading: widget.leading,
        flexibleSpace: showGlass
            ? Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isDark
                          ? AppColors.surfaceGlassBorderDark
                          : AppColors.surfaceGlassBorder,
                      width: 1,
                    ),
                  ),
                ),
              )
            : null,
        title: widget.showLogo
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
            : (widget.title != null
                ? Text(widget.title!, style: theme.textTheme.titleLarge)
                : null),
        actions: [
          if (widget.showSearch)
            IconButton(
              icon: const Icon(Icons.search, size: 24),
              onPressed: () {
                AppHaptics.light();
                widget.onSearchTap?.call();
              },
              tooltip: 'Rechercher',
            ),
          if (widget.showNotifications)
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined, size: 24),
                  onPressed: () {
                    AppHaptics.light();
                    widget.onNotificationTap?.call();
                  },
                  tooltip: 'Notifications',
                ),
                if (widget.notificationCount > 0)
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
                        widget.notificationCount > 99
                            ? '99+'
                            : '${widget.notificationCount}',
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
          if (widget.showCart)
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined, size: 24),
                  onPressed: () {
                    AppHaptics.light();
                    widget.onCartTap?.call();
                  },
                  tooltip: 'Panier',
                ),
                if (widget.cartItemCount > 0)
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
                        '${widget.cartItemCount}',
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
          if (widget.actions != null) ...widget.actions!,
        ],
      ),
    );
  }
}
