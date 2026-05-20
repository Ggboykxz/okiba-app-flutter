# AGENTS.md — Okiba

## Aperçu du projet

Super-app e-commerce pour le Gabon (Flutter, Material 3, Clean Architecture).  
Multi-rôles : client / vendeur / livreur.  
Paiements : Orange Money, MTN MoMo, Airtel Money, carte, espèces.

## Commandes

```bash
flutter analyze          # Vérification statique (0 erreurs attendu)
flutter test             # Tests unitaires
flutter build apk --debug  # Build APK Android debug
flutter run -d <device>  # Lancer sur appareil
```

## Architecture

```
lib/
├── core/          # Constantes, thème, navigation, services, utils, widgets
├── data/          # Modèles, datasources (Hive/Firestore), repositories
├── domain/        # Entités, use cases
└── presentation/  # Screens + widgets par feature (auth, client, seller, etc.)
```

**Règle** : Ne jamais mettre de logique métier dans la couche présentation.

## Conventions de code

- **Matériel 3** : Toujours utiliser `colorScheme`, pas de couleurs en dur (sauf background `#FAFAF7`)
- **Touch targets** : 56dp min (`AppSpacing.touchMin`), compact 48dp (`touchCompact`)
- **Thème** : `AppTheme.light()` / `AppTheme.dark()` — ce sont des **méthodes** (pas des getters)
- **Typo** : `GoogleFonts.interTextTheme()` via `textTheme`
- **Router** : `AppRouter.router` (static getter, pas d'instance)
- **Routes** : Routes définies dans `route_names.dart` (`RoutePaths` + `RouteNames`), utilisées dans `app_router.dart`
- **Imports** : relatifs, pas de `package:` sauf pour les packages externes
- **Format prix** : `12 500 FCFA` (espace insécable avant FCFA)
- **Phone format** : `+241 XX XX XX XX`

## Structure des fichiers (81 fichiers Dart, ~11 250 lignes)

### Core
| Fichier | Rôle |
|---------|------|
| `lib/core/constants/app_colors.dart` | Palette complète + dark mode + sémantique |
| `lib/core/constants/app_spacing.dart` | Grille 8pt, touch targets, radius |
| `lib/core/theme/app_theme.dart` | Material 3 light + dark (357 lignes) |
| `lib/core/navigation/app_router.dart` | 34 routes GoRouter |
| `lib/core/navigation/route_names.dart` | RoutePaths + RouteNames |
| `lib/core/utils/formatters.dart` | Prix FCFA, téléphone |
| `lib/core/utils/haptics.dart` | Feedback haptique |
| `lib/core/utils/validators.dart` | Validation champs |
| `lib/core/widgets/skeleton_widget.dart` | Shimmer loading |
| `lib/core/widgets/app_button.dart` | Bouton WhatsApp style |
| `lib/core/widgets/animated_list_item.dart` | Animation entrée liste |

### Phases (11/11 complètes)

| Phase | Écrans | Fichiers |
|-------|--------|----------|
| 0 — Fondation | Splash, Loading, Error, EmptyState, BottomNav, AppBar, BaseScaffold, Connectivity | 14 fichiers |
| 1 — Auth | Welcome, Register, OTP, Login, EmailRegister, EmailVerification, ResetPassword, NewPassword | 8 screens |
| 2 — Onboarding | Onboarding (3 slides), RoleSelection (3 rôles), ProfileSetup | 3 screens |
| 3 — Client | Home, Search, ProductDetail, Cart, Checkout (3-step) + 10 widgets | 15 fichiers |
| 4 — Orders | OrdersScreen (3 tabs), OrderDetail + OrderCard | 3 fichiers |
| 5 — WhatsApp | SellerWhatsApp (stats, catalogue, commandes WhatsApp) | 1 screen |
| 6 — Boutique | SellerBoutique (stats, actions, produits, perf) | 1 screen |
| 7 — Rapide | RapidDashboard, RapidPublish, RapidFeed | 3 screens |
| 8 — Livreur | DriverDashboard (demandes, actives, historique) | 1 screen |
| 9 — Chat | ChatList + ChatDetail (bulles, barre saisie) | 2 screens |
| 10 — Profil | Profile hub, EditProfile, Language (FR/EN), LowDataMode, Help (FAQ) | 5 screens |
| 11 — Notifications | NotificationsScreen (sections date, badge non-lu) | 1 screen |

### Design System
- **Palette** : Forêt Gabonaise `#1B5E3F` (P), Chaleur Soleil `#E8913A` (S), Terre Racines `#8D6E63` (T)
- **Background light** : `#FAFAF7` | **Dark** : `#0C0A09`
- **Touch targets** : 56dp (min), 48dp (compact)
- **Logo** : 7 SVGs dans `assets/logo/`

## Routage (GoRouter)

```dart
/ → splash → /welcome → /register → /otp → /onboarding → /role-selection → /profile-setup → /client/home
                       → /register/email → /register/verify → /onboarding
                       → /login → /reset-password → /reset-password/new
/client/search → /client/product/:id → /client/cart → /client/checkout
/client/orders → /client/orders/:id
/seller/whatsapp · /seller/boutique
/rapid → /rapid/publish · /rapid/feed
/driver
/chat → /chat/:id
/profile → /profile/edit · /profile/language · /profile/low-data
/help · /notifications
```

## Erreurs fréquentes & solutions

1. **`AppTheme.light()`** appelé comme getter → c'est une **méthode**, ajouter `()`
2. **`surfaceContainerHighest`** → remplacer `surfaceVariant` déprécié
3. **`CardThemeData`** / **`DialogThemeData`** → types M3, pas `CardTheme`/`DialogTheme`
4. **`activeThumbColor`** → remplacer `activeColor` déprécié sur `Switch`
5. **Import relatifs** → vérifier le nombre de `../` depuis le sous-dossier
6. **Kotlin 2.3.0** requis par `google_maps_flutter_android` → `settings.gradle.kts` ligne 23
7. **`compilerOptions { jvmTarget = JvmTarget.JVM_11 }`** → remplacer l'ancien `kotlinOptions { jvmTarget = ... }`

## Dépendances principales

| Package | Version | Usage |
|---------|---------|-------|
| `go_router` | ^17.2 | Navigation |
| `firebase_core` | ^4.9 | Backend |
| `firebase_auth` | ^6.5 | Auth |
| `cloud_firestore` | ^6.0 | DB |
| `hive` / `hive_flutter` | ^2.2 | Cache offline |
| `google_fonts` | ^8.1 | Typographie Inter |
| `flutter_svg` | ^2.0 | Logo SVG |
| `connectivity_plus` | ^7.1 | Offline |
| `google_maps_flutter` | ^2.7 | Livraison |
| `intl` | ^0.20 | i18n |
| `flutter_localizations` | SDK | i18n |

## État actuel

- ✅ **~180+ fichiers Dart**, ~11 250+ lignes
- ✅ **14 phases (0–13) complètes**, ~110 routes GoRouter
- ✅ `flutter analyze` — 0 erreurs, 0 warnings
- ✅ `flutter test` — all passed
- ✅ `flutter build apk --debug` — BUILD SUCCESSFUL
- ✅ **i18n configuré** : `l10n.yaml`, `generate: true` dans pubspec, ARB FR/EN (~430+ clés)
- ✅ `AppLocalizations.delegate` branché dans `app.dart`

## Prochaines étapes

1. **🔥 Migrer les chaînes hardcodées** → `AppLocalizations.of(context)!` dans tous les écrans
2. Ajouter `google-services.json` pour Firebase
3. Connecter les datasources réelles (Firestore au lieu de données statiques)
4. Intégrer SDK paiement mobile money
5. Tests unitaires + intégration
6. CI/CD via GitHub Actions
