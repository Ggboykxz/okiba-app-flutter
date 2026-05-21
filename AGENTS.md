# AGENTS.md — Okiba

## Aperçu du projet

Super-app e-commerce pour le Gabon (Flutter, Material 3, Clean Architecture).  
Multi-rôles : client / vendeur (WhatsApp / Boutique / Rapide) / livreur / admin.  
Paiements : Orange Money, MTN MoMo, Airtel Money, carte, espèces.  
Bilingue FR/EN avec i18n complète (~430+ clés ARB).

## Commandes

```bash
flutter analyze              # Vérification statique (0 erreurs attendu)
flutter test                 # Tests unitaires
flutter gen-l10n             # Régénérer les traductions depuis les ARB
flutter build apk --debug    # Build APK Android debug (⚠️ échoue — disque plein)
flutter run -d <device>      # Lancer sur appareil
```

## Architecture

```
lib/
├── core/          # Constantes, thème, navigation, services, utils, widgets
├── data/          # Modèles, datasources (Hive/Firestore), repositories
├── domain/        # Entités, use cases
└── presentation/  # Screens + widgets par feature (auth, client, seller, etc.)
├── l10n/          # ARB FR/EN + generated AppLocalizations
```

**Règle** : Ne jamais mettre de logique métier dans la couche présentation.

## Conventions de code

- **Material 3** : Toujours utiliser `colorScheme`, pas de couleurs en dur (sauf background `#FAFAF7`)
- **Touch targets** : 56dp min (`AppSpacing.touchMin`), compact 48dp (`touchCompact`)
- **Thème** : `AppTheme.light()` / `AppTheme.dark()` — ce sont des **méthodes** (pas des getters)
- **Typo** : `GoogleFonts.interTextTheme()` via `textTheme`
- **Router** : `AppRouter.router` (static getter, pas d'instance)
- **Routes** : Routes définies dans `route_names.dart` (`RoutePaths` + `RouteNames`), utilisées dans `app_router.dart`
- **Imports** : relatifs, pas de `package:` sauf pour les packages externes
- **Format prix** : `12 500 FCFA` (espace insécable avant FCFA)
- **Phone format** : `+241 XX XX XX XX`
- **i18n** : `AppLocalizations.of(context).snake_case_key` (nullable-getter: false)
- **Assets** : Utiliser les widgets réutilisables `OkibaLogo`, `OkibaIcon`, `OkibaAnimation`, `OkibaImage`, `EmptyStateImage`, `OnboardingImage`

## Structure des fichiers (~158 fichiers Dart, ~23 200 lignes)

### Core Widgets (9 fichiers)

| Fichier | Rôle |
|---------|------|
| `lib/core/widgets/okiba_logo.dart` | Widget logo universel (6 variants, 6 tailles, animation) |
| `lib/core/widgets/okiba_icon.dart` | Widget icône SVG (tab/category/payment/status/delivery/misc) |
| `lib/core/widgets/okiba_animation.dart` | Widget animation Lottie (8 animations) |
| `lib/core/widgets/okiba_image.dart` | Widget image cache/réseau/asset/SVG |
| `lib/core/widgets/empty_state_image.dart` | Widget illustration empty state (9 types + fallback logo) |
| `lib/core/widgets/onboarding_image.dart` | Widget illustration onboarding (4 steps + fallback logo) |
| `lib/core/widgets/skeleton_widget.dart` | Shimmer loading |
| `lib/core/widgets/app_button.dart` | Bouton WhatsApp style |
| `lib/core/widgets/animated_list_item.dart` | Animation entrée liste |

### Phases (14/14 complètes)

| Phase | Screens | Fichiers |
|-------|---------|----------|
| 0 — Fondation | Splash, Loading, Error, EmptyState, BottomNav, AppBarOkiba, BaseScaffold, Connectivity | 8 fichiers |
| 1 — Auth | Welcome, Register, OTP, Login, EmailRegister, EmailVerification, ResetPassword, NewPassword | 8 screens |
| 2 — Onboarding & Rôles | Onboarding (3 slides), RoleSelection (3 rôles), SellerTypeDetail, KycScreen, ProfileSetup | 6 screens |
| 3 — Client Achat | Home, Search, SearchResults, Category, CategoryProducts, ProductDetail, SellerProfile, Reviews, Cart, CartItemEdit, Checkout (5 steps), PaymentProcessing, PaymentFailed, Negotiate, Favorites | 24 screens |
| 4 — Client Post-Achat | OrdersScreen, OrderDetail, OrderTracking, RateOrder, Dispute | 5 screens |
| 5 — Vendeur WhatsApp | SellerWhatsApp, WhatsAppProductCreate, WhatsAppProductDetail, WhatsAppProductEdit, WhatsAppOrders, WhatsAppOrderDetail, WhatsAppStats | 7 screens |
| 6 — Vendeur Boutique | SellerBoutique, BoutiqueAnalytics, BoutiqueCatalog, BoutiqueProductCreate, BoutiqueProductEdit, BoutiqueOrders, BoutiqueOrderDetail, BoutiqueInventory, BoutiqueWallet, BoutiqueSettings | 10 screens |
| 7 — Vendeur Rapide | RapidDashboard, RapidPublish, RapidFeed, RapidProductDetail, RapidPromotions, RapidFlashSales, RapidMessages, RapidAnalytics | 8 screens |
| 8 — Livreur | DriverDashboard, DriverZone, DriverEarnings, DriverWallet, DriverProfile, NewDeliveryRequest, DeliveryNavigation, DeliveryPickup, DeliveryDropoff | 9 screens |
| 9 — Chat | ChatList, ChatDetail, SupportChat | 3 screens |
| 10 — Profil | Profile hub, EditProfile, Language, LowDataMode, NotificationSettings, PrivacySecurity, PaymentMethods, AddressBook, Referral, About, DeleteAccount, Help, AccessibilitySettings | 13 screens |
| 11 — Notifications | NotificationsScreen, NotificationDetail | 2 screens |
| 12 — Admin | AdminDashboard, AdminUsers, AdminOrders, AdminKyc | 4 screens |
| 13 — Polish | OnboardingTutorial, RateApp, WhatsNew, AccessibilitySettings, AppUpdate | 5 screens |

### Design System

- **Palette** : Forêt Gabonaise `#1B5E3F` (P), Chaleur Soleil `#E8913A` (S), Terre Racines `#8D6E63` (T)
- **Background light** : `#FAFAF7` | **Dark** : `#0C0A09`
- **Touch targets** : 56dp (min), 48dp (compact)
- **Logo** : 6 SVGs dans `assets/logo/` (mark, horizontal, vertical, appIcon, monochrome)
- **Assets** : 130+ placeholders (8 Lottie, 80+ SVG icons, 21 PNG images, 5 Inter fonts)

## Routage (GoRouter) — 99 routes

```dart
/ → splash → /welcome → /register → /otp → /onboarding → /role-selection → /profile-setup → /client/home
              → /register/email → /register/verify → /onboarding
              → /login → /reset-password → /reset-password/new
              → /seller-type-detail → /kyc → /onboarding
/client/search → /client/search/results
/client/categories → /client/category/:id → /client/category/:id/products
/client/product/:id → /client/product/:id/reviews
/client/product/:id/seller
/client/product/:id/negotiate
/client/cart → /client/cart/edit/:id
/client/checkout → /client/checkout/address → /client/checkout/delivery → /client/checkout/payment → /client/checkout/review
/client/checkout/processing → /client/checkout/success
/client/orders → /client/orders/:id → /client/orders/:id/tracking → /client/orders/:id/rate → /client/orders/:id/dispute
/client/favorites
/seller/whatsapp → /seller/whatsapp/product/create → /seller/whatsapp/product/:id → /seller/whatsapp/product/:id/edit
/seller/whatsapp/orders → /seller/whatsapp/orders/:id → /seller/whatsapp/stats
/seller/boutique → /seller/boutique/analytics → /seller/boutique/catalog → /seller/boutique/product/create
/seller/boutique/product/:id/edit → /seller/boutique/orders → /seller/boutique/orders/:id
/seller/boutique/inventory → /seller/boutique/wallet → /seller/boutique/settings
/rapid → /rapid/publish → /rapid/feed → /rapid/product/:id
/rapid/promotions → /rapid/flash-sales → /rapid/messages → /rapid/analytics
/driver → /driver/zone → /driver/earnings → /driver/wallet → /driver/profile
/driver/request → /driver/delivery/:id/navigation → /driver/delivery/:id/pickup → /driver/delivery/:id/dropoff
/chat → /chat/:id → /chat/support
/profile → /profile/edit → /profile/language → /profile/low-data → /profile/notifications
/profile/privacy → /profile/payment-methods → /profile/addresses → /profile/referral
/profile/about → /profile/delete → /profile/accessibility
/help → /notifications → /notifications/:id
/admin → /admin/users → /admin/orders → /admin/kyc
/onboarding-tutorial → /rate-app → /whats-new → /app-update
```

## Erreurs fréquentes & solutions

1. **`AppTheme.light()`** appelé comme getter → c'est une **méthode**, ajouter `()`
2. **`surfaceContainerHighest`** → remplacer `surfaceVariant` déprécié
3. **`CardThemeData`** / **`DialogThemeData`** → types M3, pas `CardTheme`/`DialogTheme`
4. **`activeThumbColor`** → remplacer `activeColor` déprécié sur `Switch`
5. **Import relatifs** → vérifier le nombre de `../` depuis le sous-dossier
6. **Kotlin 2.3.0** requis par `google_maps_flutter_android` → `settings.gradle.kts` ligne 23
7. **`compilerOptions { jvmTarget = JvmTarget.JVM_11 }`** → remplacer l'ancien `kotlinOptions { jvmTarget = ... }`
8. **`textTheme.headline6`** déprécié → remplacer par `headlineSmall` en M3
9. **Asset file warnings** → `assets/` fichiers déclarés dans pubspec.yaml doivent exister sur disque (placeholder OK)

## Dépendances principales

| Package | Version | Usage |
|---------|---------|-------|
| `go_router` | ^17.2 | Navigation (99 routes) |
| `firebase_core` | ^4.9 | Backend |
| `firebase_auth` | ^6.5 | Auth (Phone OTP) |
| `cloud_firestore` | ^6.0 | DB |
| `firebase_storage` | ^13.0 | Upload images |
| `firebase_messaging` | ^16.2 | Push notifications |
| `hive` / `hive_flutter` | ^2.2 | Cache offline |
| `google_fonts` | ^8.1 | Typographie Inter |
| `flutter_svg` | ^2.0 | Logo + icônes SVG |
| `lottie` | ^3.1 | Animations |
| `cached_network_image` | ^3.4 | Cache images réseau |
| `intl` | ^0.20 | i18n |
| `flutter_localizations` | SDK | i18n |
| `shimmer` | ^3.0 | Skeleton loading |
| `flutter_bloc` | ^9.1 | State management |
| `connectivity_plus` | ^7.1 | Offline detection |
| `google_maps_flutter` | ^2.14 | Cartographie livraison |
| `geolocator` | ^14.0 | GPS |
| `image_picker` | ^1.1 | Caméra/Galerie |
| `share_plus` | ^12.0 | Partage liens |

## État actuel

- ✅ **~158 fichiers Dart**, ~23 200 lignes
- ✅ **14 phases (0–13) complètes**, **99 routes GoRouter**
- ✅ **101 screens** (auth 13, client 24, seller 25, delivery 9, chat 3, profile 13, notif 2, shared 7, admin 4, splash 1)
- ✅ `flutter analyze` — **0 erreurs, 0 warnings**
- ✅ `flutter test` — **all passed**
- ✅ **i18n complète** : `l10n.yaml`, ARB FR/EN (~430+ clés), `AppLocalizations.delegate` branché
- ✅ **Assets intégrés** : 6 widgets réutilisables, 130+ placeholders (Lottie, SVG, PNG, fonts)
- ✅ **Tous les écrans utilisent** `AppLocalizations.of(context).key` (plus de chaînes hardcodées)
- ✅ `flutter build apk --debug` — **BUILD SUCCESSFUL**
- ❌ Firebase non configuré (pas de `google-services.json`)
- ❌ Aucune connexion backend — toutes les données sont statiques/mock

## Prochaines étapes

1. **🔥 Libérer de l'espace disque** pour build APK
2. Ajouter `google-services.json` pour Firebase
3. Connecter Firestore collections (users, products, orders, deliveries, chats, notifications)
4. Intégrer SDK paiement mobile money (Orange Money, MTN MoMo, Airtel Money)
5. Intégrer Firebase Cloud Messaging (FCM) pour push notifications
6. Remplacer assets placeholders par les vrais fichiers (Lottie, SVG, PNG, fonts Inter)
7. Tests unitaires + intégration
8. CI/CD via GitHub Actions
