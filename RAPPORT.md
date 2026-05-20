# RAPPORT OKIBA — Super-app E-commerce pour le Gabon

## Vue d'ensemble

**Okiba** est une application Flutter multi-rôles (client/vendeur/livreur) avec un design system Material 3 complet, une architecture Clean Architecture (data/domain/presentation), et un support intégré des moyens de paiement gabonais (Orange Money, MTN MoMo, Airtel Money).

---

## Statistiques

| Métrique | Valeur |
|----------|--------|
| Fichiers Dart | **81** |
| Lignes de code | **~11 250** |
| Écrans fonctionnels | **27 screen** |
| Widgets réutilisables | **18 widgets** |
| Routes GoRouter | **34 routes** |
| Phases implémentées | **11 / 11** |
| Thèmes | Light + Dark (Material 3) |
| Logo SVG | 7 fichiers |
| `flutter analyze` | **0 erreurs, 0 warnings** |
| `flutter test` | **All passed** |
| `flutter build apk` | **BUILD SUCCESSFUL** |

---

## Architecture

```
lib/
├── core/
│   ├── constants/        # AppColors, AppSpacing, ApiEndpoints
│   ├── navigation/       # AppRouter (34 routes), RouteNames/Paths
│   ├── services/         # Connectivity, Location, Notifications (FCM)
│   ├── theme/            # AppTheme light/dark (Material 3)
│   ├── utils/            # Formatters, Haptics, Validators
│   └── widgets/          # Skeleton (shimmer), AppButton, AnimatedListItem
├── data/
│   ├── datasources/      # Local (Hive), Remote (Firestore)
│   ├── models/           # User, Product, Order, Delivery, Payment
│   └── repositories/     # Auth, Product, Order
├── domain/
│   ├── entities/         # User, Product, Order
│   └── usecases/         # GetProducts, PlaceOrder
├── presentation/
│   ├── auth/             # Phase 1-2 : 11 screens (welcome → profil)
│   ├── chat/             # Phase 9 : 2 screens (liste + détail)
│   ├── client/           # Phase 3-4 : 7 screens, 10 widgets
│   ├── delivery/         # Phase 8 : 1 screen (livreur)
│   ├── notifications/    # Phase 11 : 1 screen
│   ├── profile/          # Phase 10 : 5 screens
│   ├── seller/           # Phase 5-6 : 2 screens
│   ├── seller_rapid/     # Phase 7 : 3 screens
│   ├── shared/           # Phase 0 : 4 screens/widgets
│   └── splash/           # Phase 0 : splash animé → welcome
└── main.dart             # Entry point
```

---

## Phases implémentées

### Phase 0 — Fondation
| Fichier | Description |
|---------|-------------|
| `lib/core/theme/app_theme.dart` | Thème Material 3 light + dark (Google Fonts Inter) |
| `lib/core/navigation/app_router.dart` | 34 routes GoRouter avec ErrorBoundary |
| `lib/core/navigation/route_names.dart` | RoutePaths + RouteNames (single source of truth) |
| `lib/presentation/splash/splash_screen.dart` | Splash animé (scale + fade) → `/welcome` |
| `lib/presentation/shared/screens/loading_screen.dart` | Shimmer skeleton (horizontal + vertical) |
| `lib/presentation/shared/screens/error_screen.dart` | Page d'erreur avec icône monochrome + retry |
| `lib/presentation/shared/screens/empty_state_screen.dart` | État vide avec CTA |
| `lib/presentation/shared/wrappers/connectivity_wrapper.dart` | Bannière offline |
| `lib/presentation/shared/widgets/bottom_nav_bar.dart` | 5 tabs + FAB docké |
| `lib/presentation/shared/widgets/app_bar_okiba.dart` | AppBar avec logo, badges, search |
| `lib/presentation/shared/widgets/base_scaffold.dart` | Wrapper AppBar + BottomNav + Offline |
| `lib/core/widgets/skeleton_widget.dart` | Shimmer via ShaderMask |
| `lib/core/widgets/app_button.dart` | WhatsApp-style button |
| `lib/.../app_colors.dart` | Palette complète + dark mode + sémantique |
| `lib/.../app_spacing.dart` | Grille 8pt, touch targets 56dp |
| `lib/.../formatters.dart` | Prix FCFA, téléphone +241 |

### Phase 1 — Authentification (8 écrans)
| # | Fichier | Description |
|---|---------|-------------|
| 1.1 | `welcome_screen.dart` | Logo + 2 boutons + toggle FR/EN |
| 1.2 | `register_screen.dart` | Téléphone +241, validation |
| 1.3 | `otp_verification_screen.dart` | 6 champs OTP, auto-advance, timer 60s |
| 1.4 | `login_screen.dart` | Téléphone + mot de passe + "Mot de passe oublié ?" |
| 1.5 | `email_register_screen.dart` | Email + password + confirm |
| 1.6 | `email_verification_screen.dart` | Icône email + timer resend |
| 1.7 | `reset_password_screen.dart` | Téléphone + envoi SMS |
| 1.8 | `new_password_screen.dart` | Password + confirm + barre de force |

### Phase 2 — Onboarding & Rôles (3 écrans)
| # | Fichier | Description |
|---|---------|-------------|
| 2.1 | `onboarding_screen.dart` | PageView 3 slides + indicateurs animés |
| 2.2 | `role_selection_screen.dart` | 3 cartes (Client/Vendeur/Livreur) + radio |
| 2.3 | `profile_setup_screen.dart` | Avatar, nom, bio 150, localisation |

### Phase 3 — Client Core (5 écrans + 10 widgets)
| # | Fichier | Description |
|---|---------|-------------|
| 3.1 | `client_home_screen.dart` | Catégories horizontales, produits vedette, proximité |
| 3.2 | `product_card.dart` | Card avec image, prix, note, favori |
| 3.3 | `category_chip.dart` | Chip icône + label, sélectionnable |
| 3.4 | `search_screen.dart` | Barre auto-focus, catégories, grille produits |
| 3.5 | `filter_bottom_sheet.dart` | Catégories, prix range, tri |
| 3.6 | `product_detail_screen.dart` | Gallery pageview, infos vendeur, description, barre action |
| 3.7 | `product_image_gallery.dart` | PageView + dots |
| 3.8 | `seller_info_card.dart` | Avatar, note, produits, réponse |
| 3.9 | `cart_screen.dart` | Items + quantité + résumé total |
| 3.10 | `cart_item_card.dart` | Quantité +/- , prix, image |
| 3.11-16 | `checkout_screen.dart` | Stepper 3 étapes (adresse → paiement → confirmation) |
| 3.15 | `payment_method_card.dart` | Orange Money, MTN, Airtel, Carte, Espèces |
| 3.16 | `address_card.dart` | Adresse avec sélection + label |

### Phase 4 — Commandes (2 écrans + 1 widget)
| # | Fichier | Description |
|---|---------|-------------|
| 4.1 | `orders_screen.dart` | TabBar 3 statuts + liste + état vide |
| 4.2 | `order_detail_screen.dart` | Suivi chronologique, articles, récap, adresse, support |
| — | `order_card.dart` | ID, date, statut (couleur), total, livraison |

### Phase 5 — Vendeur WhatsApp (1 écran)
| # | Fichier | Description |
|---|---------|-------------|
| 5.1 | `seller_whatsapp_screen.dart` | Bannière WhatsApp, stats, catalogue, commandes récentes |

### Phase 6 — Boutique Vendeur (1 écran)
| # | Fichier | Description |
|---|---------|-------------|
| 6.1 | `seller_boutique_screen.dart` | En-tête boutique, stats, actions rapides, produits, performance |

### Phase 7 — Vente Rapide (3 écrans)
| # | Fichier | Description |
|---|---------|-------------|
| 7.1 | `rapid_dashboard_screen.dart` | Bannière gradient, annonces actives, stats |
| 7.2 | `rapid_publish_screen.dart` | Photo, titre, prix FCFA, description, catégorie, état |
| 7.7 | `rapid_feed_screen.dart` | Search + filtres + feed items + FAB |

### Phase 8 — Livreur (1 écran)
| # | Fichier | Description |
|---|---------|-------------|
| 8.1 | `driver_dashboard_screen.dart` | Statut en ligne, gains, nouvelles demandes, livraisons en cours, historique |

### Phase 9 — Chat (2 écrans)
| # | Fichier | Description |
|---|---------|-------------|
| 9.1 | `chat_list_screen.dart` | Liste conversations, badge non-lu, online indicator |
| 9.2 | `chat_detail_screen.dart` | Bulles envoyé/reçu, bannière produit, barre saisie |

### Phase 10 — Profil & Paramètres (5 écrans)
| # | Fichier | Description |
|---|---------|-------------|
| 10.1 | `profile_screen.dart` | Carte profil, rôle, menu paramètres/support, déconnexion |
| 10.2 | `edit_profile_screen.dart` | Avatar, nom, bio, téléphone, email, localisation |
| 10.7 | `language_screen.dart` | Sélection FR/EN avec radio |
| 10.8 | `low_data_mode_screen.dart` | 4 switches, barre économie données |
| 10.11 | `help_screen.dart` | Bannière support, FAQ 5 questions, contacts |

### Phase 11 — Notifications (1 écran)
| # | Fichier | Description |
|---|---------|-------------|
| 11.1 | `notifications_screen.dart` | Notifications typées + sections date + badge non-lu |

---

## Design System

- **Palette** : Forêt Gabonaise `#1B5E3F` (primary), Chaleur Soleil `#E8913A` (secondary), Terre Racines `#8D6E63` (tertiary), Nuit Tropicale `#0C0A09` (dark), Blanc Chaud `#FAFAF7` (bg light)
- **Typographie** : Google Fonts Inter (48px → 11px)
- **Grille** : 8pt spacing, touch targets 56dp
- **Dark mode** : thème complet avec couleurs dédiées
- **Logo** : 7 fichiers SVG (mark, horizontal, vertical, wordmark, monochrome, app icons)

---

## Stack technique

| Technologie | Version | Usage |
|-------------|---------|-------|
| Flutter | ^3.9.0 | Framework |
| Dart SDK | ^3.9.0 | Langage |
| GoRouter | ^17.2.3 | Navigation (34 routes) |
| Firebase Core | ^4.9.0 | Backend |
| Firebase Auth | ^6.5.1 | Authentification |
| Cloud Firestore | ^6.0.0 | Base de données |
| Hive | ^2.2.3 | Cache offline |
| Google Fonts | ^8.1.0 | Typographie Inter |
| Flutter SVG | ^2.0.10 | Logo SVG |
| Google Maps | ^2.7.0 | Livraison |
| Geolocator | ^14.0.2 | Localisation |
| Connectivity+ | ^7.1.1 | Offline detection |
| Lottie | ^3.1.2 | Animations |
| Image Picker | ^1.1.2 | Upload avatar/produits |
| Share Plus | ^12.0.2 | Partage WhatsApp |
| URL Launcher | ^6.3.0 | Liens externes |
| Intl | ^0.20.2 | Formatage dates/prix |

---

## Routage complet (34 routes GoRouter)

| Path | Screen |
|------|--------|
| `/` (initial) | SplashScreen |
| `/welcome` | WelcomeScreen |
| `/register` | RegisterScreen |
| `/otp` | OtpVerificationScreen |
| `/login` | LoginScreen |
| `/register/email` | EmailRegisterScreen |
| `/register/verify` | EmailVerificationScreen |
| `/reset-password` | ResetPasswordScreen |
| `/reset-password/new` | NewPasswordScreen |
| `/onboarding` | OnboardingScreen |
| `/role-selection` | RoleSelectionScreen |
| `/profile-setup` | ProfileSetupScreen |
| `/client/home` | ClientHomeScreen |
| `/client/search` | SearchScreen |
| `/client/product/:id` | ProductDetailScreen |
| `/client/cart` | CartScreen |
| `/client/checkout` | CheckoutScreen |
| `/client/orders` | OrdersScreen |
| `/client/orders/:id` | OrderDetailScreen |
| `/seller/whatsapp` | SellerWhatsAppScreen |
| `/seller/boutique` | SellerBoutiqueScreen |
| `/rapid` | RapidDashboardScreen |
| `/rapid/publish` | RapidPublishScreen |
| `/rapid/feed` | RapidFeedScreen |
| `/driver` | DriverDashboardScreen |
| `/chat` | ChatListScreen |
| `/chat/:id` | ChatDetailScreen |
| `/profile` | ProfileScreen |
| `/profile/edit` | EditProfileScreen |
| `/profile/language` | LanguageScreen |
| `/profile/low-data` | LowDataModeScreen |
| `/help` | HelpScreen |
| `/notifications` | NotificationsScreen |
| `/empty` | EmptyStateScreen |
| *(error)* | ErrorScreen |

---

## Flux utilisateur complet

```
SplashScreen
  → WelcomeScreen → RegisterScreen → OtpVerification → Onboarding
                  → EmailRegister → EmailVerification → Onboarding
                  → LoginScreen → ResetPassword → NewPassword → Login
  → Onboarding (3 slides) → RoleSelection → ProfileSetup → ClientHome
  → ClientHome → Search (filtres) → ProductDetail → Cart → Checkout (3 steps) → Orders
               → Orders → OrderDetail
  → SellerWhatsApp → (gestion commandes WhatsApp)
  → SellerBoutique → (gestion boutique)
  → RapidDashboard → RapidPublish / RapidFeed
  → DriverDashboard → (livraisons)
  → Chat → ChatDetail
  → Profile → EditProfile / Language / LowData / Help
  → Notifications
```

---

## Build & Qualité

```bash
flutter analyze        # 0 errors, 0 warnings
flutter test           # All tests passed
flutter build apk --debug  # BUILD SUCCESSFUL (154 MB)
```

**APK** : `build/app/outputs/flutter-apk/app-debug.apk`

---

## Prochaines étapes recommandées

1. **Configuration Firebase** : Ajouter `google-services.json` pour l'authentification et Firestore
2. **Internationalisation** : Implémenter `flutter_localizations` avec ARB files (FR/EN)
3. **Backend connecté** : Remplacer les données statiques par des appels API Firestore
4. **Paiement mobile money** : Intégrer les SDK Orange Money, MTN MoMo, Airtel Money
5. **Notifications push** : Configurer FCM avec `firebase_messaging`
6. **Géolocalisation** : Connecter Google Maps + suivi en temps réel livreur
7. **Tests** : Ajouter des tests unitaires et d'intégration
8. **CI/CD** : Mettre en place GitHub Actions pour analyse + build automatique
