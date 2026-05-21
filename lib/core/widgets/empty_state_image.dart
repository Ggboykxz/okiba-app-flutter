import 'package:flutter/material.dart';
import 'okiba_logo.dart';

enum EmptyStateType {
  cart,
  orders,
  search,
  notifications,
  chat,
  favorites,
  products,
  delivery,
  generic,
}

class EmptyStateImage extends StatelessWidget {
  final EmptyStateType type;
  final double size;

  const EmptyStateImage({
    super.key,
    required this.type,
    this.size = 120,
  });

  String get _assetPath {
    switch (type) {
      case EmptyStateType.cart:
        return 'assets/images/empty_states/empty_cart.png';
      case EmptyStateType.orders:
        return 'assets/images/empty_states/empty_orders.png';
      case EmptyStateType.search:
        return 'assets/images/empty_states/empty_search.png';
      case EmptyStateType.notifications:
        return 'assets/images/empty_states/empty_notifications.png';
      case EmptyStateType.chat:
        return 'assets/images/empty_states/empty_chat.png';
      case EmptyStateType.favorites:
        return 'assets/images/empty_states/empty_favorites.png';
      case EmptyStateType.products:
        return 'assets/images/empty_states/empty_products.png';
      case EmptyStateType.delivery:
        return 'assets/images/empty_states/empty_delivery.png';
      case EmptyStateType.generic:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (type == EmptyStateType.generic) {
      return OkibaLogo(
        variant: LogoVariant.monochrome,
        size: _logoSize(),
        color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
      );
    }

    return Image.asset(
      _assetPath,
      width: size,
      height: size,
      errorBuilder: (context, error, stackTrace) {
        return OkibaLogo(
          variant: LogoVariant.monochrome,
          size: _logoSize(),
          color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
        );
      },
    );
  }

  LogoSize _logoSize() {
    if (size <= 16) return LogoSize.xs;
    if (size <= 24) return LogoSize.sm;
    if (size <= 40) return LogoSize.md;
    if (size <= 64) return LogoSize.lg;
    if (size <= 100) return LogoSize.xl;
    return LogoSize.xxl;
  }
}
