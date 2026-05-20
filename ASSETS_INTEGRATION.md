# ASSETS_INTEGRATION.md — Intégration Complète des Assets

> **App :** Okiba — Le Marché Gabonais  
> **Plateforme :** Flutter (Firebase Studio)  
> **Date :** 2026-05-20  
> **Version :** 1.0.0  
> **Objectif :** Intégrer animations, icônes, fonts et images sans perturber le projet existant

---

## 📁 Structure des Assets (Finale)

```
okiba/
├── assets/
│   ├── animations/           # Lottie (.json)
│   │   ├── splash_success.json
│   │   ├── payment_success.json
│   │   ├── loading_dots.json
│   │   ├── empty_state.json
│   │   ├── error_state.json
│   │   ├── order_delivered.json
│   │   ├── new_message.json
│   │   └── driver_arriving.json
│   │
│   ├── fonts/                # Fonts (.ttf / .otf)
│   │   ├── Inter/
│   │   │   ├── Inter-Regular.ttf
│   │   │   ├── Inter-Medium.ttf
│   │   │   ├── Inter-SemiBold.ttf
│   │   │   ├── Inter-Bold.ttf
│   │   │   └── Inter-ExtraBold.ttf
│   │   └── Local/            # Fallback système si Inter non chargé
│   │
│   ├── icons/                # Icônes custom SVG/PNG
│   │   ├── tab/
│   │   │   ├── home.svg
│   │   │   ├── home_filled.svg
│   │   │   ├── search.svg
│   │   │   ├── search_filled.svg
│   │   │   ├── sell.svg
│   │   │   ├── sell_filled.svg
│   │   │   ├── cart.svg
│   │   │   ├── cart_filled.svg
│   │   │   ├── profile.svg
│   │   │   └── profile_filled.svg
│   │   ├── category/
│   │   │   ├── fashion.svg
│   │   │   ├── electronics.svg
│   │   │   ├── home_goods.svg
│   │   │   ├── auto.svg
│   │   │   ├── services.svg
│   │   │   ├── beauty.svg
│   │   │   ├── sports.svg
│   │   │   └── food.svg
│   │   ├── payment/
│   │   │   ├── orange_money.svg
│   │   │   ├── mtn_momo.svg
│   │   │   ├── airtel_money.svg
│   │   │   ├── cash.svg
│   │   │   └── card.svg
│   │   ├── status/
│   │   │   ├── pending.svg
│   │   │   ├── confirmed.svg
│   │   │   ├── preparing.svg
│   │   │   ├── ready.svg
│   │   │   ├── in_transit.svg
│   │   │   ├── delivered.svg
│   │   │   └── cancelled.svg
│   │   ├── delivery/
│   │   │   ├── motorcycle.svg
│   │   │   ├── car.svg
│   │   │   ├── pickup.svg
│   │   │   ├── dropoff.svg
│   │   │   ├── qr_scan.svg
│   │   │   ├── navigation.svg
│   │   │   └── location_pin.svg
│   │   └── misc/
│   │       ├── whatsapp.svg
│   │       ├── share.svg
│   │       ├── copy_link.svg
│   │       ├── voice_input.svg
│   │       ├── camera.svg
│   │       ├── gallery.svg
│   │       ├── filter.svg
│   │       ├── sort.svg
│   │       ├── heart.svg
│   │       ├── heart_filled.svg
│   │       ├── star.svg
│   │       ├── star_half.svg
│   │       ├── star_outline.svg
│   │       ├── check.svg
│   │       ├── close.svg
│   │       ├── arrow_back.svg
│   │       ├── arrow_forward.svg
│   │       ├── arrow_down.svg
│   │       ├── arrow_up.svg
│   │       ├── more_vert.svg
│   │       ├── edit.svg
│   │       ├── delete.svg
│   │       ├── add.svg
│   │       ├── remove.svg
│   │       ├── notification.svg
│   │       ├── notification_badge.svg
│   │       ├── settings.svg
│   │       ├── help.svg
│   │       ├── logout.svg
│   │       ├── dark_mode.svg
│   │       ├── light_mode.svg
│   │       ├── wifi_off.svg
│   │       ├── refresh.svg
│   │       ├── send.svg
│   │       ├── attach.svg
│   │       ├── mic.svg
│   │       ├── mic_off.svg
│   │       ├── play.svg
│   │       ├── pause.svg
│   │       ├── map.svg
│   │       ├── list.svg
│   │       ├── grid.svg
│   │       ├── calendar.svg
│   │       ├── clock.svg
│   │       ├── truck.svg
│   │       ├── package.svg
│   │       ├── shield.svg
│   │       ├── verified.svg
│   │       ├── badge_bronze.svg
│   │       ├── badge_silver.svg
│   │       ├── badge_gold.svg
│   │       └── badge_platinum.svg
│   │
│   ├── images/               # Images statiques
│   │   ├── onboarding/
│   │   │   ├── onboarding_1.png      # Acheter
│   │   │   ├── onboarding_2.png      # Vendre
│   │   │   ├── onboarding_3.png      # Livrer
│   │   │   └── onboarding_4.png      # Confiance
│   │   ├── empty_states/
│   │   │   ├── empty_cart.png
│   │   │   ├── empty_orders.png
│   │   │   ├── empty_search.png
│   │   │   ├── empty_notifications.png
│   │   │   ├── empty_chat.png
│   │   │   ├── empty_favorites.png
│   │   │   ├── empty_products.png
│   │   │   └── empty_delivery.png
│   │   ├── errors/
│   │   │   ├── error_network.png
│   │   │   ├── error_server.png
│   │   │   ├── error_not_found.png
│   │   │   └── error_generic.png
│   │   ├── illustrations/
│   │   │   ├── payment_success.png
│   │   │   ├── order_confirmed.png
│   │   │   ├── kyc_verified.png
│   │   │   ├── welcome_hero.png
│   │   │   └── support_hero.png
│   │   └── backgrounds/
│   │       ├── pattern_kente.png     # Subtile, opacity 5%
│   │       └── pattern_geometric.png # Subtile, opacity 5%
│   │
│   └── logo/                 # Logo OKIBA (déjà généré)
│       ├── okiba_mark.svg
│       ├── okiba_logo_horizontal.svg
│       ├── okiba_logo_vertical.svg
│       ├── okiba_app_icon.svg
│       ├── okiba_app_icon_dark.svg
│       └── okiba_mark_monochrome.svg
│
├── lib/
│   └── ...
│
└── pubspec.yaml              # À mettre à jour
```

---

## 📝 pubspec.yaml — Section Assets Complète

```yaml
# pubspec.yaml
# AJOUTER / REMPLACER la section flutter existante par celle-ci
# NE PAS toucher aux autres sections (dependencies, dev_dependencies, etc.)

flutter:
  uses-material-design: true

  # ═══════════════════════════════════════════════════════════════
  # FONTS — Inter (Google Fonts) + fallback système
  # ═══════════════════════════════════════════════════════════════
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter/Inter-Regular.ttf
          weight: 400
        - asset: assets/fonts/Inter/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter/Inter-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Inter/Inter-Bold.ttf
          weight: 700
        - asset: assets/fonts/Inter/Inter-ExtraBold.ttf
          weight: 800

  # ═══════════════════════════════════════════════════════════════
  # ASSETS — Tous les fichiers du dossier assets/
  # ═══════════════════════════════════════════════════════════════
  assets:
    # ─── Logo ───────────────────────────────────────────────────
    - assets/logo/okiba_mark.svg
    - assets/logo/okiba_logo_horizontal.svg
    - assets/logo/okiba_logo_vertical.svg
    - assets/logo/okiba_app_icon.svg
    - assets/logo/okiba_app_icon_dark.svg
    - assets/logo/okiba_mark_monochrome.svg

    # ─── Animations Lottie ────────────────────────────────────────
    - assets/animations/splash_success.json
    - assets/animations/payment_success.json
    - assets/animations/loading_dots.json
    - assets/animations/empty_state.json
    - assets/animations/error_state.json
    - assets/animations/order_delivered.json
    - assets/animations/new_message.json
    - assets/animations/driver_arriving.json

    # ─── Icônes — Tab Bar ───────────────────────────────────────
    - assets/icons/tab/home.svg
    - assets/icons/tab/home_filled.svg
    - assets/icons/tab/search.svg
    - assets/icons/tab/search_filled.svg
    - assets/icons/tab/sell.svg
    - assets/icons/tab/sell_filled.svg
    - assets/icons/tab/cart.svg
    - assets/icons/tab/cart_filled.svg
    - assets/icons/tab/profile.svg
    - assets/icons/tab/profile_filled.svg

    # ─── Icônes — Catégories ──────────────────────────────────────
    - assets/icons/category/fashion.svg
    - assets/icons/category/electronics.svg
    - assets/icons/category/home_goods.svg
    - assets/icons/category/auto.svg
    - assets/icons/category/services.svg
    - assets/icons/category/beauty.svg
    - assets/icons/category/sports.svg
    - assets/icons/category/food.svg

    # ─── Icônes — Paiement ────────────────────────────────────────
    - assets/icons/payment/orange_money.svg
    - assets/icons/payment/mtn_momo.svg
    - assets/icons/payment/airtel_money.svg
    - assets/icons/payment/cash.svg
    - assets/icons/payment/card.svg

    # ─── Icônes — Statuts ─────────────────────────────────────────
    - assets/icons/status/pending.svg
    - assets/icons/status/confirmed.svg
    - assets/icons/status/preparing.svg
    - assets/icons/status/ready.svg
    - assets/icons/status/in_transit.svg
    - assets/icons/status/delivered.svg
    - assets/icons/status/cancelled.svg

    # ─── Icônes — Livraison ───────────────────────────────────────
    - assets/icons/delivery/motorcycle.svg
    - assets/icons/delivery/car.svg
    - assets/icons/delivery/pickup.svg
    - assets/icons/delivery/dropoff.svg
    - assets/icons/delivery/qr_scan.svg
    - assets/icons/delivery/navigation.svg
    - assets/icons/delivery/location_pin.svg

    # ─── Icônes — Divers ──────────────────────────────────────────
    - assets/icons/misc/whatsapp.svg
    - assets/icons/misc/share.svg
    - assets/icons/misc/copy_link.svg
    - assets/icons/misc/voice_input.svg
    - assets/icons/misc/camera.svg
    - assets/icons/misc/gallery.svg
    - assets/icons/misc/filter.svg
    - assets/icons/misc/sort.svg
    - assets/icons/misc/heart.svg
    - assets/icons/misc/heart_filled.svg
    - assets/icons/misc/star.svg
    - assets/icons/misc/star_half.svg
    - assets/icons/misc/star_outline.svg
    - assets/icons/misc/check.svg
    - assets/icons/misc/close.svg
    - assets/icons/misc/arrow_back.svg
    - assets/icons/misc/arrow_forward.svg
    - assets/icons/misc/arrow_down.svg
    - assets/icons/misc/arrow_up.svg
    - assets/icons/misc/more_vert.svg
    - assets/icons/misc/edit.svg
    - assets/icons/misc/delete.svg
    - assets/icons/misc/add.svg
    - assets/icons/misc/remove.svg
    - assets/icons/misc/notification.svg
    - assets/icons/misc/notification_badge.svg
    - assets/icons/misc/settings.svg
    - assets/icons/misc/help.svg
    - assets/icons/misc/logout.svg
    - assets/icons/misc/dark_mode.svg
    - assets/icons/misc/light_mode.svg
    - assets/icons/misc/wifi_off.svg
    - assets/icons/misc/refresh.svg
    - assets/icons/misc/send.svg
    - assets/icons/misc/attach.svg
    - assets/icons/misc/mic.svg
    - assets/icons/misc/mic_off.svg
    - assets/icons/misc/play.svg
    - assets/icons/misc/pause.svg
    - assets/icons/misc/map.svg
    - assets/icons/misc/list.svg
    - assets/icons/misc/grid.svg
    - assets/icons/misc/calendar.svg
    - assets/icons/misc/clock.svg
    - assets/icons/misc/truck.svg
    - assets/icons/misc/package.svg
    - assets/icons/misc/shield.svg
    - assets/icons/misc/verified.svg
    - assets/icons/misc/badge_bronze.svg
    - assets/icons/misc/badge_silver.svg
    - assets/icons/misc/badge_gold.svg
    - assets/icons/misc/badge_platinum.svg

    # ─── Images — Onboarding ──────────────────────────────────────
    - assets/images/onboarding/onboarding_1.png
    - assets/images/onboarding/onboarding_2.png
    - assets/images/onboarding/onboarding_3.png
    - assets/images/onboarding/onboarding_4.png

    # ─── Images — Empty States ────────────────────────────────────
    - assets/images/empty_states/empty_cart.png
    - assets/images/empty_states/empty_orders.png
    - assets/images/empty_states/empty_search.png
    - assets/images/empty_states/empty_notifications.png
    - assets/images/empty_states/empty_chat.png
    - assets/images/empty_states/empty_favorites.png
    - assets/images/empty_states/empty_products.png
    - assets/images/empty_states/empty_delivery.png

    # ─── Images — Erreurs ─────────────────────────────────────────
    - assets/images/errors/error_network.png
    - assets/images/errors/error_server.png
    - assets/images/errors/error_not_found.png
    - assets/images/errors/error_generic.png

    # ─── Images — Illustrations ───────────────────────────────────
    - assets/images/illustrations/payment_success.png
    - assets/images/illustrations/order_confirmed.png
    - assets/images/illustrations/kyc_verified.png
    - assets/images/illustrations/welcome_hero.png
    - assets/images/illustrations/support_hero.png

    # ─── Images — Backgrounds ─────────────────────────────────────
    - assets/images/backgrounds/pattern_kente.png
    - assets/images/backgrounds/pattern_geometric.png
```

---

## 🔧 Dépendances à Ajouter (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter

  # ─── Logo & Icons ─────────────────────────────────────────────
  flutter_svg: ^2.0.10          # Rendu SVG (logo OKIBA + icônes)
  lottie: ^3.1.2               # Animations Lottie

  # ─── Fonts ──────────────────────────────────────────────────────
  google_fonts: ^6.2.1          # Inter via CDN (fallback)
  # OU chargement local via assets/fonts/ (recommandé pour offline)

  # ─── Images ───────────────────────────────────────────────────
  cached_network_image: ^3.4.1  # Cache images réseau + placeholder
  image_picker: ^1.1.2           # Caméra / Galerie (déjà probablement là)
  image_cropper: ^8.0.2         # Recadrage photos produit/avatar
  flutter_image_compress: ^2.3.0  # Compression avant upload

  # ─── Cache & Offline ────────────────────────────────────────────
  hive: ^2.2.3                  # Cache local (déjà probablement là)
  hive_flutter: ^1.1.0

  # ─── Firebase (déjà probablement là) ────────────────────────────
  firebase_core: ^3.0.0
  firebase_storage: ^13.0.0      # Upload images
  firebase_messaging: ^15.0.0    # Notifications push

  # ─── Utils ────────────────────────────────────────────────────
  path_provider: ^2.1.4         # Chemins fichiers locaux
  permission_handler: ^11.3.1     # Permissions caméra/galerie/localisation
```

---

## 🎨 Widgets Réutilisables pour Assets

### 1. OkibaLogo — Widget Logo Universel

```dart
// lib/core/widgets/okiba_logo.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum LogoVariant {
  mark,           // Mark seul (splash, loading)
  horizontal,     // Mark + "OKIBA" horizontal (headers)
  vertical,       // Mark + "OKIBA" vertical (onboarding)
  wordmark,       // "OKIBA" texte seul
  appIcon,        // Mark dans carré arrondi (app icon fallback)
  monochrome,     // Mark monochrome (empty states, watermarks)
}

enum LogoSize {
  xs,    // 16px
  sm,    // 24px
  md,    // 40px
  lg,    // 64px
  xl,    // 100px
  xxl,   // 140px
}

class OkibaLogo extends StatelessWidget {
  final LogoVariant variant;
  final LogoSize size;
  final Color? color;           // Override couleur (monochrome)
  final bool animate;             // Scale animation on first build

  const OkibaLogo({
    super.key,
    this.variant = LogoVariant.mark,
    this.size = LogoSize.md,
    this.color,
    this.animate = false,
  });

  double get _size {
    switch (size) {
      case LogoSize.xs:  return 16;
      case LogoSize.sm:  return 24;
      case LogoSize.md:  return 40;
      case LogoSize.lg:  return 64;
      case LogoSize.xl:  return 100;
      case LogoSize.xxl: return 140;
    }
  }

  String get _assetPath {
    switch (variant) {
      case LogoVariant.mark:
        return 'assets/logo/okiba_mark.svg';
      case LogoVariant.horizontal:
        return 'assets/logo/okiba_logo_horizontal.svg';
      case LogoVariant.vertical:
        return 'assets/logo/okiba_logo_vertical.svg';
      case LogoVariant.wordmark:
        return 'assets/logo/okiba_logo_horizontal.svg'; // Utilise horizontal sans mark
      case LogoVariant.appIcon:
        return 'assets/logo/okiba_app_icon.svg';
      case LogoVariant.monochrome:
        return 'assets/logo/okiba_mark_monochrome.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = _size;

    Widget logo = SvgPicture.asset(
      _assetPath,
      width: logoSize,
      height: logoSize,
      colorFilter: color != null && variant == LogoVariant.monochrome
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );

    if (animate) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.8, end: 1.0),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: logo,
          );
        },
      );
    }

    return logo;
  }
}

// ─── Usage ──────────────────────────────────────────────────────
// SplashScreen :
//   OkibaLogo(variant: LogoVariant.mark, size: LogoSize.xxl, animate: true)
//
// AppBar :
//   OkibaLogo(variant: LogoVariant.mark, size: LogoSize.sm)
//
// Empty State :
//   OkibaLogo(
//     variant: LogoVariant.monochrome,
//     size: LogoSize.lg,
//     color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.3),
//   )
```

### 2. OkibaIcon — Widget Icône Universel

```dart
// lib/core/widgets/okiba_icon.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum IconCategory {
  tab,
  category,
  payment,
  status,
  delivery,
  misc,
}

class OkibaIcon extends StatelessWidget {
  final String name;
  final IconCategory category;
  final double size;
  final Color? color;
  final bool filled;

  const OkibaIcon({
    super.key,
    required this.name,
    required this.category,
    this.size = 24,
    this.color,
    this.filled = false,
  });

  String get _assetPath {
    final cat = category.name;
    final suffix = filled && category == IconCategory.tab ? '_filled' : '';
    return 'assets/icons/$cat/${name}${suffix}.svg';
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurfaceVariant;

    return SvgPicture.asset(
      _assetPath,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}

// ─── Usage ──────────────────────────────────────────────────────
// TabBar :
//   OkibaIcon(name: 'home', category: IconCategory.tab, size: 24)
//   OkibaIcon(name: 'home', category: IconCategory.tab, size: 24, filled: true)
//
// Catégorie :
//   OkibaIcon(name: 'fashion', category: IconCategory.category, size: 32)
//
// Paiement :
//   OkibaIcon(name: 'orange_money', category: IconCategory.payment, size: 40)
//
// Statut commande :
//   OkibaIcon(name: 'delivered', category: IconCategory.status, size: 20,
//             color: Theme.of(context).colorScheme.success)
//
// Livraison :
//   OkibaIcon(name: 'motorcycle', category: IconCategory.delivery, size: 24)
//
// Divers :
//   OkibaIcon(name: 'verified', category: IconCategory.misc, size: 16,
//             color: Theme.of(context).colorScheme.primary)
```

### 3. OkibaAnimation — Widget Animation Lottie

```dart
// lib/core/widgets/okiba_animation.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum AnimationType {
  splashSuccess,
  paymentSuccess,
  loadingDots,
  emptyState,
  errorState,
  orderDelivered,
  newMessage,
  driverArriving,
}

class OkibaAnimation extends StatelessWidget {
  final AnimationType type;
  final double size;
  final bool repeat;
  final VoidCallback? onComplete;

  const OkibaAnimation({
    super.key,
    required this.type,
    this.size = 120,
    this.repeat = false,
    this.onComplete,
  });

  String get _assetPath {
    switch (type) {
      case AnimationType.splashSuccess:
        return 'assets/animations/splash_success.json';
      case AnimationType.paymentSuccess:
        return 'assets/animations/payment_success.json';
      case AnimationType.loadingDots:
        return 'assets/animations/loading_dots.json';
      case AnimationType.emptyState:
        return 'assets/animations/empty_state.json';
      case AnimationType.errorState:
        return 'assets/animations/error_state.json';
      case AnimationType.orderDelivered:
        return 'assets/animations/order_delivered.json';
      case AnimationType.newMessage:
        return 'assets/animations/new_message.json';
      case AnimationType.driverArriving:
        return 'assets/animations/driver_arriving.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      _assetPath,
      width: size,
      height: size,
      repeat: repeat,
      onLoaded: (composition) {
        if (!repeat && onComplete != null) {
          Future.delayed(composition.duration, onComplete!);
        }
      },
    );
  }
}

// ─── Usage ──────────────────────────────────────────────────────
// Splash :
//   OkibaAnimation(type: AnimationType.splashSuccess, size: 140, repeat: false)
//
// Payment success :
//   OkibaAnimation(type: AnimationType.paymentSuccess, size: 120,
//                  onComplete: () => context.go('/orders'))
//
// Loading :
//   OkibaAnimation(type: AnimationType.loadingDots, size: 60, repeat: true)
//
// Empty state :
//   OkibaAnimation(type: AnimationType.emptyState, size: 120)
//
// Error :
//   OkibaAnimation(type: AnimationType.errorState, size: 100)
//
// Order delivered :
//   OkibaAnimation(type: AnimationType.orderDelivered, size: 80)
//
// New message :
//   OkibaAnimation(type: AnimationType.newMessage, size: 40, repeat: true)
//
// Driver arriving :
//   OkibaAnimation(type: AnimationType.driverArriving, size: 60, repeat: true)
```

### 4. OkibaImage — Widget Image avec Cache + Placeholder

```dart
// lib/core/widgets/okiba_image.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType {
  network,      // URL Firebase Storage / CDN
  asset,        // Fichier local assets/images/
  svg,          // SVG local
}

class OkibaImage extends StatelessWidget {
  final String path;
  final ImageType type;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const OkibaImage({
    super.key,
    required this.path,
    this.type = ImageType.network,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget image;

    switch (type) {
      case ImageType.network:
        image = CachedNetworkImage(
          imageUrl: path,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => placeholder ?? _defaultPlaceholder(),
          errorWidget: (context, url, error) => errorWidget ?? _defaultError(),
          memCacheWidth: width?.toInt(),
          memCacheHeight: height?.toInt(),
        );
        break;

      case ImageType.asset:
        image = Image.asset(
          path,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) =>
              errorWidget ?? _defaultError(),
        );
        break;

      case ImageType.svg:
        image = SvgPicture.asset(
          path,
          width: width,
          height: height,
          fit: fit,
        );
        break;
    }

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  Widget _defaultPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  Widget _defaultError() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Icon(Icons.broken_image, color: Colors.grey),
    );
  }
}

// ─── Usage ──────────────────────────────────────────────────────
// Photo produit (réseau) :
//   OkibaImage(
//     path: product.imageUrl,
//     width: double.infinity,
//     height: 200,
//     borderRadius: BorderRadius.circular(12),
//   )
//
// Illustration locale :
//   OkibaImage(
//     path: 'assets/images/illustrations/payment_success.png',
//     type: ImageType.asset,
//     width: 120,
//     height: 120,
//   )
//
// Logo SVG :
//   OkibaImage(
//     path: 'assets/logo/okiba_mark.svg',
//     type: ImageType.svg,
//     width: 40,
//     height: 40,
//   )
```

### 5. EmptyStateImage — Widget Illustration Empty State

```dart
// lib/core/widgets/empty_state_image.dart
import 'package:flutter/material.dart';
import 'okiba_animation.dart';
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
        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.3),
      );
    }

    // Si l'image n'existe pas encore, fallback sur logo monochrome
    return Image.asset(
      _assetPath,
      width: size,
      height: size,
      errorBuilder: (context, error, stackTrace) {
        return OkibaLogo(
          variant: LogoVariant.monochrome,
          size: _logoSize(),
          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.3),
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
```

### 6. OnboardingImage — Widget Illustration Onboarding

```dart
// lib/core/widgets/onboarding_image.dart
import 'package:flutter/material.dart';

enum OnboardingStep {
  buy,      // Acheter
  sell,     // Vendre
  deliver,  // Livrer
  trust,    // Confiance
}

class OnboardingImage extends StatelessWidget {
  final OnboardingStep step;
  final double size;

  const OnboardingImage({
    super.key,
    required this.step,
    this.size = 200,
  });

  String get _assetPath {
    switch (step) {
      case OnboardingStep.buy:
        return 'assets/images/onboarding/onboarding_1.png';
      case OnboardingStep.sell:
        return 'assets/images/onboarding/onboarding_2.png';
      case OnboardingStep.deliver:
        return 'assets/images/onboarding/onboarding_3.png';
      case OnboardingStep.trust:
        return 'assets/images/onboarding/onboarding_4.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _assetPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // Fallback : logo animé
        return OkibaLogo(
          variant: LogoVariant.mark,
          size: _logoSize(),
          animate: true,
        );
      },
    );
  }

  LogoSize _logoSize() {
    if (size <= 40) return LogoSize.md;
    if (size <= 64) return LogoSize.lg;
    if (size <= 100) return LogoSize.xl;
    return LogoSize.xxl;
  }
}
```

---

## 🎯 Intégration dans les Écrans Existants

### SplashScreen — Avec Logo Animé

```dart
// REMPLACER dans lib/presentation/splash/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/okiba_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.forward();

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) context.go('/welcome');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO OKIBA — Mark animé
            OkibaLogo(
              variant: LogoVariant.mark,
              size: LogoSize.xxl,
              animate: true,
            ),
            const SizedBox(height: 32),
            // Wordmark avec fade in
            FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'OKIBA',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'LE MARCHÉ GABONAIS',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      letterSpacing: 6,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### AppBar — Avec Logo

```dart
// REMPLACER dans lib/presentation/shared/widgets/app_bar_okiba.dart

import 'package:flutter/material.dart';
import '../../core/widgets/okiba_logo.dart';

class AppBarOkiba extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showLogo;
  final bool centerTitle;
  final bool transparent;

  const AppBarOkiba({
    super.key,
    this.title,
    this.actions,
    this.showLogo = true,
    this.centerTitle = false,
    this.transparent = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      elevation: transparent ? 0 : null,
      scrolledUnderElevation: 2,
      backgroundColor: transparent
          ? Colors.transparent
          : colorScheme.background,
      foregroundColor: colorScheme.onSurface,
      centerTitle: centerTitle,
      title: showLogo && title == null
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
          : title != null
              ? Text(
                  title!,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                )
              : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}
```

### BottomNavBar — Avec Icônes Custom

```dart
// REMPLACER dans lib/presentation/shared/widgets/bottom_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/widgets/okiba_icon.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        HapticFeedback.lightImpact();
        onTap(index);
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      items: [
        BottomNavigationBarItem(
          icon: OkibaIcon(
            name: 'home',
            category: IconCategory.tab,
            color: currentIndex == 0
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
          activeIcon: OkibaIcon(
            name: 'home',
            category: IconCategory.tab,
            filled: true,
            color: colorScheme.primary,
          ),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: OkibaIcon(
            name: 'search',
            category: IconCategory.tab,
            color: currentIndex == 1
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
          activeIcon: OkibaIcon(
            name: 'search',
            category: IconCategory.tab,
            filled: true,
            color: colorScheme.primary,
          ),
          label: 'Recherche',
        ),
        BottomNavigationBarItem(
          icon: OkibaIcon(
            name: 'sell',
            category: IconCategory.tab,
            color: currentIndex == 2
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
          activeIcon: OkibaIcon(
            name: 'sell',
            category: IconCategory.tab,
            filled: true,
            color: colorScheme.primary,
          ),
          label: 'Vendre',
        ),
        BottomNavigationBarItem(
          icon: OkibaIcon(
            name: 'cart',
            category: IconCategory.tab,
            color: currentIndex == 3
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
          activeIcon: OkibaIcon(
            name: 'cart',
            category: IconCategory.tab,
            filled: true,
            color: colorScheme.primary,
          ),
          label: 'Panier',
        ),
        BottomNavigationBarItem(
          icon: OkibaIcon(
            name: 'profile',
            category: IconCategory.tab,
            color: currentIndex == 4
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
          activeIcon: OkibaIcon(
            name: 'profile',
            category: IconCategory.tab,
            filled: true,
            color: colorScheme.primary,
          ),
          label: 'Profil',
        ),
      ],
    );
  }
}
```

### EmptyStateScreen — Avec Illustration

```dart
// REMPLACER dans lib/presentation/shared/screens/empty_state_screen.dart

import 'package:flutter/material.dart';
import '../../../core/widgets/empty_state_image.dart';
import '../../../core/widgets/okiba_animation.dart';

class EmptyStateScreen extends StatelessWidget {
  final EmptyStateType type;
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyStateScreen({
    super.key,
    required this.type,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration ou animation selon disponibilité
            EmptyStateImage(type: type, size: 120),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

### PaymentSuccessScreen — Avec Animation Lottie

```dart
// lib/presentation/client/checkout/screens/order_success_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/okiba_animation.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animation Lottie succès
            OkibaAnimation(
              type: AnimationType.paymentSuccess,
              size: 140,
              onComplete: () {
                HapticFeedback.mediumImpact();
                HapticFeedback.selectionClick();
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Commande confirmée !',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Votre commande #OKB-12345 est en cours de préparation.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                context.go('/client/orders');
              },
              child: const Text('Voir ma commande'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                context.go('/client/home');
              },
              child: const Text('Continuer mes achats'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 📋 Checklist d'Intégration

### Étape 1 : Créer la structure de dossiers
```bash
cd okiba
mkdir -p assets/{animations,fonts/Inter,icons/{tab,category,payment,status,delivery,misc},images/{onboarding,empty_states,errors,illustrations,backgrounds},logo}
```

### Étape 2 : Copier les fichiers
- [ ] Copier les 6 fichiers SVG logo dans `assets/logo/`
- [ ] Télécharger Inter fonts (Google Fonts) → `assets/fonts/Inter/`
- [ ] Créer/icônes SVG dans `assets/icons/` (ou utiliser Phosphor Icons en fallback)
- [ ] Créer illustrations PNG dans `assets/images/`
- [ ] Télécharger animations Lottie → `assets/animations/`

### Étape 3 : Mettre à jour pubspec.yaml
- [ ] Remplacer section `flutter:` par le bloc complet ci-dessus
- [ ] Ajouter dépendances `flutter_svg`, `lottie`, `cached_network_image`
- [ ] `flutter pub get`

### Étape 4 : Créer les widgets
- [ ] `lib/core/widgets/okiba_logo.dart`
- [ ] `lib/core/widgets/okiba_icon.dart`
- [ ] `lib/core/widgets/okiba_animation.dart`
- [ ] `lib/core/widgets/okiba_image.dart`
- [ ] `lib/core/widgets/empty_state_image.dart`
- [ ] `lib/core/widgets/onboarding_image.dart`

### Étape 5 : Remplacer dans les écrans existants
- [ ] `SplashScreen` → OkibaLogo
- [ ] `AppBarOkiba` → OkibaLogo
- [ ] `BottomNavBar` → OkibaIcon
- [ ] `EmptyStateScreen` → EmptyStateImage
- [ ] `OrderSuccessScreen` → OkibaAnimation
- [ ] Toutes les images produit → OkibaImage (CachedNetworkImage)

### Étape 6 : Vérifier
- [ ] `flutter analyze` — 0 erreurs
- [ ] `flutter build apk --debug` — BUILD SUCCESSFUL
- [ ] Test dark mode sur tous les écrans modifiés
- [ ] Test offline (mode avion) — placeholders s'affichent
- [ ] Test taille APK — vérifier augmentation < 5MB

---

## 🎨 Fallbacks si Assets Manquants

| Asset manquant | Fallback | Widget |
|---------------|----------|--------|
| Logo SVG | Material Icons `store` | `Icon(Icons.store)` |
| Icône custom | Phosphor Icons | `PhosphorIcon()` |
| Animation Lottie | CircularProgressIndicator | `CircularProgressIndicator()` |
| Image onboarding | Logo animé | `OkibaLogo(animate: true)` |
| Image empty state | Logo monochrome | `OkibaLogo(variant: monochrome)` |
| Image erreur | Logo + texte | `OkibaLogo + Text('Erreur')` |
| Font Inter | Système Roboto/SF Pro | `Theme.of(context).textTheme` |

---

> **Document vivant** — Mettre à jour quand de nouveaux assets sont ajoutés  
> **Dernière mise à jour :** 2026-05-20
