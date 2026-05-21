# RAPPORT COMPLET OKIBA — Inventaire Détaillé

> **App :** Okiba — Le Marché Gabonais  
> **Version :** 1.0.0+1  
> **Date :** 2026-05-21  
> **Plateforme :** Flutter 3.35+, Material 3, Clean Architecture  
> **Statut :** Tous les écrans implémentés, build APK réussi ✅

---

## SOMMAIRE

1. [Métriques clés](#1-métriques-clés)
2. [Architecture](#2-architecture)
3. [Phases 0–13 — Détail complet](#3-phases-0-13--détail-complet)
4. [Routes GoRouter (99 routes)](#4-routes-gorouter-99-routes)
5. [i18n / Localisation](#5-i18n--localisation)
6. [Assets](#6-assets)
7. [Dépendances](#7-dépendances)
8. [Constantes & Design System](#8-constantes--design-system)
9. [Services](#9-services)
10. [Data Layer](#10-data-layer)
11. [Widgets réutilisables](#11-widgets-réutilisables)
12. [État actuel & Roadmap](#12-état-actuel--roadmap)

---

## 1. Métriques clés

| Métrique | Valeur |
|----------|--------|
| Fichiers Dart (lib/) | 158 |
| Lignes de code | ~23 200 |
| Écrans | 101 |
| Routes GoRouter | 99 |
| Phases | 14 (0–13) |
| Clés ARB (FR/EN) | ~897 |
| Assets (fichiers) | ~130+ |
| Widgets réutilisables core | 9 |
| Widgets client | 9 |
| Widgets partagés | 3 |
| Modèles de données | 5 |
| Services | 4 |
| Dépendances | 25 packages |
| `flutter analyze` | ✅ 0 erreurs, 0 warnings |
| `flutter test` | ✅ All passed |
| `flutter build apk --debug` | ✅ BUILD SUCCESSFUL |

---

## 2. Architecture

```
lib/
├── core/
│   ├── constants/        # AppColors (90 consts), AppSpacing (75 consts), ApiEndpoints (44)
│   ├── theme/            # AppTheme.light(), AppTheme.dark() — Material 3 ThemeData
│   ├── navigation/       # AppRouter (99 GoRoutes), RouteNames (130)
│   ├── services/         # Notification, Location, PushNotificationHandler, Connectivity
│   ├── utils/            # AppFormatters, AppValidators, AppHaptics
│   └── widgets/          # OkibaLogo, OkibaIcon, OkibaAnimation, OkibaImage,
│                         # EmptyStateImage, OnboardingImage, SkeletonWidget,
│                         # AppButton, AnimatedListItem
├── data/
│   ├── models/           # UserModel, ProductModel, OrderModel, PaymentModel, DeliveryJobModel
│   ├── datasources/      # RemoteDataSource (Firebase), LocalDataSource (Hive)
│   └── repositories/     # AuthRepository, ProductRepository, OrderRepository
├── domain/
│   ├── entities/         # UserEntity, ProductEntity, OrderEntity
│   └── usecases/         # GetProducts, PlaceOrder
├── presentation/
│   ├── splash/           # SplashScreen (1)
│   ├── auth/             # 13 screens (welcome, register, OTP, login, email, reset, etc.)
│   ├── client/           # 24 screens (home, search, product, cart, checkout, orders, etc.)
│   ├── seller/           # 17 screens (WhatsApp 7 + Boutique 10)
│   ├── seller_rapid/     # 8 screens (dashboard, publish, feed, analytics, etc.)
│   ├── delivery/         # 9 screens (dashboard, zone, earnings, wallet, navigation, etc.)
│   ├── chat/             # 3 screens (list, detail, support) + 1 widget (chat_offer_bubble)
│   ├── notifications/    # 2 screens (list, detail) + 1 widget (in_app_banner)
│   ├── profile/          # 13 screens (hub, edit, language, settings, etc.)
│   ├── admin/            # 4 screens (dashboard, users, orders, KYC)
│   └── shared/           # 7 screens (loading, error, empty, tutorial, rate, what's new, update)
│       └── widgets/      # BottomNavBar, AppBarOkiba, BaseScaffold
│       └── wrappers/     # ConnectivityWrapper
└── l10n/                 # app_en.arb, app_fr.arb, AppLocalizations généré
```

---

## 3. Phases 0–13 — Détail complet

### Phase 0 — Fondation (8 fichiers)

| # | Écran / Widget | Fichier | Description |
|---|---------------|---------|-------------|
| 0.1 | SplashScreen | `lib/presentation/splash/splash_screen.dart` | Logo Okiba avec animation scale (0.8→1.0), auto-redirect vers /welcome après 2.5s |
| 0.2 | LoadingScreen | `lib/presentation/shared/screens/loading_screen.dart` | Skeleton shimmer simulant app bar + catégories + grille produits |
| 0.3 | ErrorScreen | `lib/presentation/shared/screens/error_screen.dart` | Icône erreur + titre + message + bouton réessayer |
| 0.4 | EmptyStateScreen | `lib/presentation/shared/screens/empty_state_screen.dart` | EmptyStateImage (9 types) + titre optionnel + sous-titre + action |
| 0.5 | BottomNavBar | `lib/presentation/shared/widgets/bottom_nav_bar.dart` | 5 onglets (Accueil/Search/Vendre/Panier/Profil) avec OkibaIcon, badge panier, FAB vendre |
| 0.6 | AppBarOkiba | `lib/presentation/shared/widgets/app_bar_okiba.dart` | AppBar configurable : logo, titre, retour, search, panier, notifs, 3 styles |
| 0.7 | BaseScaffold | `lib/presentation/shared/widgets/base_scaffold.dart` | Scaffold composite : AppBarOkiba + BottomNavBar + ConnectivityWrapper + FAB + body |
| 0.8 | ConnectivityWrapper | `lib/presentation/shared/wrappers/connectivity_wrapper.dart` | Bannière offline overlay, auto-dismiss au retour connexion |

### Phase 1 — Auth (8 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 1.1 | WelcomeScreen | `welcome_screen.dart` | Logo + tagline + boutons S'inscrire / Se connecter |
| 1.2 | RegisterScreen | `register_screen.dart` | Champ téléphone +241, validation, navigation vers OTP |
| 1.3 | OTPVerificationScreen | `otp_verification_screen.dart` | 6 champs OTP, auto-paste, timer 60s, renvoi |
| 1.4 | LoginScreen | `login_screen.dart` | Téléphone + mot de passe, toggle visibilité, validation |
| 1.5 | EmailRegisterScreen | `email_register_screen.dart` | Email + mot de passe + confirmation, validation |
| 1.6 | EmailVerificationScreen | `email_verification_screen.dart` | Timer 60s, renvoi, bouton vérifié |
| 1.7 | ResetPasswordScreen | `reset_password_screen.dart` | Champ téléphone, validation |
| 1.8 | NewPasswordScreen | `new_password_screen.dart` | Nouveau mot de passe + confirmation + force mètre |

### Phase 2 — Onboarding & Rôles (5 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 2.1 | OnboardingScreen | `onboarding_screen.dart` | 3 slides (Acheter/Vendre/Livrer) avec OnboardingImage, dots, Skip/Next/Start |
| 2.2 | RoleSelectionScreen | `role_selection_screen.dart` | 3 cartes (Client/Vendeur/Livreur) avec icônes, sélection radio |
| 2.3 | SellerTypeDetailScreen | `seller_type_detail_screen.dart` | Comparaison WhatsApp/Boutique/Rapide avec features, badge Recommandé |
| 2.4 | KycScreen | `kyc_screen.dart` | 3 étapes (selfie → ID recto → ID verso), états verifying/verified |
| 2.5 | ProfileSetupScreen | `profile_setup_screen.dart` | Nom + bio + avatar + localisation |

### Phase 3 — Client Achat (24 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 3.1 | ClientHomeScreen | `client_home_screen.dart` | En-tête + catégories horizontales + grille produits en vedette (4) |
| 3.2 | SearchScreen | `search_screen.dart` | Barre recherche, catégories chips, recherches récentes, tendances |
| 3.3 | SearchResultsScreen | `search_results_screen.dart` | Grille/liste produits, filtres, tri, mode vue |
| 3.4 | CategoryScreen | `category_screen.dart` | Grille 12 catégories avec icônes et descriptions |
| 3.5 | CategoryProductsScreen | `category_products_screen.dart` | Grille 2 colonnes produits filtrés par catégorie |
| 3.6 | ProductDetailScreen | `product_detail_screen.dart` | Galerie photos + infos vendeur + prix + description + avis + actions |
| 3.7 | SellerProfileScreen | `seller_profile_screen.dart` | SliverAppBar (200px) + avatar + stats + produits |
| 3.8 | ReviewsScreen | `reviews_screen.dart` | 8 avis avec note, badge vérifié, tri |
| 3.9 | CartScreen | `cart_screen.dart` | Liste articles + sous-total/livraison/total + checkout |
| 3.10 | CartItemEditScreen | `cart_item_edit_screen.dart` | Quantité (1-10) + note + variante |
| 3.11 | NegotiateScreen | `negotiate_screen.dart` | Prix presets (5) + prix personnalisé + message |
| 3.12 | FavoritesScreen | `favorites_screen.dart` | Grille produits favoris + vider |
| 3.13 | CheckoutScreen | `checkout/checkout_screen.dart` | Stepper 3 étapes (adresse → livraison → paiement) |
| 3.14 | CheckoutAddressScreen | `checkout/checkout_address_screen.dart` | Sélection adresse + GPS + nouvelle adresse |
| 3.15 | CheckoutDeliveryScreen | `checkout/checkout_delivery_screen.dart` | 3 modes (Standard/Express/Retrait) avec prix |
| 3.16 | CheckoutPaymentScreen | `checkout/checkout_payment_screen.dart` | 5 moyens (Orange Money, MTN MoMo, Airtel, Cash, Carte) |
| 3.17 | CheckoutReviewScreen | `checkout/checkout_review_screen.dart` | Récapitulatif complet + commander |
| 3.18 | PaymentProcessingScreen | `checkout/payment_processing_screen.dart` | Animation spinning 2s, auto-redirect 3s |
| 3.19 | PaymentFailedScreen | `checkout/payment_failed_screen.dart` | Erreur + réessayer + changer méthode + accueil |
| 3.20 | OrdersScreen | `orders/orders_screen.dart` | 3 tabs (En cours/Livré/Annulé) |
| 3.21 | OrderDetailScreen | `orders/order_detail_screen.dart` | Statut + timeline + articles + vendeur + paiement + actions |
| 3.22 | OrderTrackingScreen | `orders/order_tracking_screen.dart` | Timeline 4 étapes + map placeholder + livreur |
| 3.23 | RateOrderScreen | `orders/rate_order_screen.dart` | Étoiles vendeur/livreur + commentaire + confirmation |
| 3.24 | DisputeScreen | `dispute_screen.dart` | 6 raisons + description + preuves |

### Phase 4 — Client Post-Achat (5 screens)

*Intégrée dans Phase 3 ci-dessus (écrans 3.20–3.24)*

### Phase 5 — Vendeur WhatsApp (7 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 5.1 | SellerWhatsAppScreen | `seller_whatsapp_screen.dart` | Dashboard : résumé commandes/messages/vues/produits, catalogue, partage |
| 5.2 | WhatsAppProductCreateScreen | `whatsapp_product_create_screen.dart` | Photos (1-5) + nom + prix + description |
| 5.3 | WhatsAppProductDetailScreen | `whatsapp_product_detail_screen.dart` | Photo + infos + partage/édition/suppression + QR code |
| 5.4 | WhatsAppProductEditScreen | `whatsapp_product_edit_screen.dart` | Formulaire pré-rempli nom/prix/description |
| 5.5 | WhatsAppOrdersScreen | `whatsapp_orders_screen.dart` | 5 commandes mock avec infos client + statut + contact WhatsApp |
| 5.6 | WhatsAppOrderDetailScreen | `whatsapp_order_detail_screen.dart` | Infos client + articles + timeline + confirmer/annuler |
| 5.7 | WhatsAppStatsScreen | `whatsapp_stats_screen.dart` | 7/30/90 jours, clics/commandes/ventes/conversion, top produits |

### Phase 6 — Vendeur Boutique (10 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 6.1 | SellerBoutiqueScreen | `seller_boutique_screen.dart` | Dashboard : produits/commandes/ventes/note, actions rapides |
| 6.2 | BoutiqueAnalyticsScreen | `boutique_analytics_screen.dart` | 7/30/90j/1an, revenus/commandes/vues/conversion/panier moyen |
| 6.3 | BoutiqueCatalogScreen | `boutique_catalog_screen.dart` | Recherche + filtres statut + grille + tri + édition/suppression |
| 6.4 | BoutiqueProductCreateScreen | `boutique_product_create_screen.dart` | Photos (3) + nom/description/prix/stock/SKU/poids/catégorie/variantes |
| 6.5 | BoutiqueProductEditScreen | `boutique_product_edit_screen.dart` | Formulaire pré-rempli + toggle actif/caché + suppression |
| 6.6 | BoutiqueOrdersScreen | `boutique_orders_screen.dart` | 4 tabs (En cours/Expédié/Livré/Annulé) |
| 6.7 | BoutiqueOrderDetailScreen | `boutique_order_detail_screen.dart` | Timeline 5 étapes + articles + paiement + actions (confirmer/expédier/annuler) |
| 6.8 | BoutiqueInventoryScreen | `boutique_inventory_screen.dart` | Barre résumé (total/faible/rupture/surstock) + liste + ajustement stock |
| 6.9 | BoutiqueWalletScreen | `boutique_wallet_screen.dart` | Solde + retrait + historique transactions + formulaire retrait |
| 6.10 | BoutiqueSettingsScreen | `boutique_settings_screen.dart` | Nom/description/adresse/téléphone/email + bannière + horaires |

### Phase 7 — Vendeur Rapide (8 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 7.1 | RapidDashboardScreen | `rapid_dashboard_screen.dart` | Carte bienvenue + stats (annonces actives/vues/messages) + actions rapides |
| 7.2 | RapidPublishScreen | `rapid_publish_screen.dart` | Photos + titre/prix/description + catégorie + état + publier |
| 7.3 | RapidFeedScreen | `rapid_feed_screen.dart` | Barre recherche + chips catégories + annonces avec photo/prix/titre |
| 7.4 | RapidProductDetailScreen | `rapid_product_detail_screen.dart` | Photos + infos + vendeur + contact + partage/favori |
| 7.5 | RapidPromotionsScreen | `rapid_promotions_screen.dart` | 5 forfaits (vedette/urgent/nouveau/visibilité+) + activation |
| 7.6 | RapidFlashSalesScreen | `rapid_flash_sales_screen.dart` | 3 sections (actives/à venir/terminées) + création flash sale |
| 7.7 | RapidMessagesScreen | `rapid_messages_screen.dart` | Liste messages avec avatar/nom/pré-visu/temps + badges non-lus |
| 7.8 | RapidAnalyticsScreen | `rapid_analytics_screen.dart` | Période + stats (annonces/contacts/vues) + performance par annonce + conseils |

### Phase 8 — Livreur (9 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 8.1 | DriverDashboardScreen | `driver_dashboard_screen.dart` | Toggle en ligne/hors ligne + gains + nouvelle demande + livraison en cours + historique |
| 8.2 | DriverZoneScreen | `driver_zone_screen.dart` | Liste zones + rayon + activation/désactivation |
| 8.3 | DriverEarningsScreen | `driver_earnings_screen.dart` | Période + gains + graphique + stats (distance/note/livraisons) + transactions |
| 8.4 | DriverWalletScreen | `driver_wallet_screen.dart` | Solde + retrait (+ badges sécurisé/instantané) + méthodes + historique |
| 8.5 | DriverProfileScreen | `driver_profile_screen.dart` | Avatar + nom + niveau (Gold) + stats + véhicule + documents |
| 8.6 | NewDeliveryRequestScreen | `new_delivery_request_screen.dart` | Barre progression + adresses + distance/frais + timer + accepter/ignorer |
| 8.7 | DeliveryNavigationScreen | `delivery_navigation_screen.dart` | Map placeholder + itinéraire + infos + appeler + scanner/finaliser |
| 8.8 | DeliveryPickupScreen | `delivery_pickup_screen.dart` | QR code + saisie manuelle + photo colis + confirmer |
| 8.9 | DeliveryDropoffScreen | `delivery_dropoff_screen.dart` | Succès + gains + QR client + photo preuve + signature + finaliser |

### Phase 9 — Chat (3 screens + 1 widget)

| # | Écran / Widget | Fichier | Description |
|---|---------------|---------|-------------|
| 9.1 | ChatListScreen | `chat_list_screen.dart` | Liste conversations avec avatar/nom/dernier message/temps/badge/online |
| 9.2 | ChatDetailScreen | `chat_detail_screen.dart` | Bulles messages + offre prix + en-tête produit + input (texte/attacher/micro) |
| 9.3 | ChatOfferBubble | `chat/widgets/chat_offer_bubble.dart` | Carte offre avec produit/prix original/prix offert + Accepter/Refuser/Contre-proposer |
| 9.4 | SupportChatScreen | `support_chat_screen.dart` | Messages support + réponses rapides + ticket + photo |

### Phase 10 — Profil (13 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 10.1 | ProfileScreen | `profile_screen.dart` | Avatar + nom + rôle + solde + menu (ordres/favoris/paiement/adresses/notifs/langue/...) |
| 10.2 | EditProfileScreen | `edit_profile_screen.dart` | Avatar + nom/bio + téléphone/email + localisation |
| 10.3 | LanguageScreen | `language_screen.dart` | FR / EN avec noms natifs + descriptions |
| 10.4 | LowDataModeScreen | `low_data_mode_screen.dart` | Compression image/basse résolution/pas de vidéo auto/Wi-Fi only + stats données économisées |
| 10.5 | NotificationSettingsScreen | `notification_settings_screen.dart` | Push/Email/SMS + toggles par type (commandes/promos/chat/livraison/newsletter/OTP) |
| 10.6 | PrivacySecurityScreen | `privacy_security_screen.dart` | Biométrie + 2FA + partage données + changer mot de passe + politique + télécharger |
| 10.7 | PaymentMethodsScreen | `payment_methods_screen.dart` | Mobile Money (Orange/MTN/Airtel) + cartes bancaires + espèces |
| 10.8 | AddressBookScreen | `address_book_screen.dart` | Liste adresses + étiquette + défaut + édition/suppression + ajout |
| 10.9 | ReferralScreen | `referral_screen.dart` | Code parrainage + partage + stats (amis/gagnés/en attente) + fonctionnement + historique |
| 10.10 | AboutScreen | `about_screen.dart` | Logo + version + "Made in Gabon" + liens (CGU/confidentialité/mentions légales/licences) + noter/signaler |
| 10.11 | DeleteAccountScreen | `delete_account_screen.dart` | Avertissement + 6 raisons + checkbox confirmation + suppression |
| 10.12 | HelpScreen | `help_screen.dart` | Contact (email/WhatsApp/appel) + FAQ (commande/paiement/livraison/retour/vendeur) |
| 10.13 | AccessibilitySettingsScreen | `accessibility_settings_screen.dart` | Taille texte + contraste élevé + réduire mouvement + grandes zones tactiles + aperçu |

### Phase 11 — Notifications (2 screens + 1 widget)

| # | Écran / Widget | Fichier | Description |
|---|---------------|---------|-------------|
| 11.1 | NotificationsScreen | `notifications_screen.dart` | Sectionné (Aujourd'hui/Hier/Cette semaine/Plus tôt) + badges + tout marquer lu |
| 11.2 | NotificationDetailScreen | `notification_detail_screen.dart` | Icône + titre + corps + détails commande + voir commande |
| 11.3 | InAppNotificationBanner | `widgets/in_app_notification_banner.dart` | Bannière overlay (4s) + icône/titre/corps + action tap + show() statique |

### Phase 12 — Admin (4 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 12.1 | AdminDashboardScreen | `admin_dashboard_screen.dart` | Cartes stats (utilisateurs/commandes/revenus/litiges) + commandes récentes |
| 12.2 | AdminUsersScreen | `admin_users_screen.dart` | Filtres rôle (Tous/Client/Vendeur/Livreur) + liste + actions (suspendre/réactiver/vérifier/supprimer) |
| 12.3 | AdminOrdersScreen | `admin_orders_screen.dart` | 3 tabs (Toutes/Litiges/Remboursements) + motif litige + résoudre/rembourser |
| 12.4 | AdminKycScreen | `admin_kyc_screen.dart` | 3 tabs (En attente/Approuvé/Rejeté) + selfie/ID + approuver/rejeter avec motif |

### Phase 13 — Polish & Optimisation (5 screens)

| # | Écran | Fichier | Description |
|---|-------|---------|-------------|
| 13.1 | OnboardingTutorialScreen | `onboarding_tutorial_screen.dart` | 4 étapes (Accueil/Panier/Paiement/Livraison) + dots + passer/terminer |
| 13.2 | RateAppScreen | `rate_app_screen.dart` | 1-5 étoiles + feedback positif/négatif + confirmation + lien store |
| 13.3 | WhatsNewScreen | `whats_new_screen.dart` | 5 nouveautés (Boutique/Rapide/Tracking/Airtel/Perf) + continuer |
| 13.4 | AccessibilitySettingsScreen | `accessibility_settings_screen.dart` | (déjà listé en 10.13) |
| 13.5 | AppUpdateScreen | `app_update_screen.dart` | Icône app + version + fonctionnalités + mettre à jour/plus tard |

---

## 4. Routes GoRouter (99 routes)

```
/                                  → SplashScreen
/empty                             → EmptyStateScreen (generic)

# Phase 1 — Auth
/welcome                           → WelcomeScreen
/register                          → RegisterScreen
/otp                               → OTPVerificationScreen
/login                             → LoginScreen
/register/email                    → EmailRegisterScreen
/register/verify                   → EmailVerificationScreen
/reset-password                    → ResetPasswordScreen
/reset-password/new                → NewPasswordScreen

# Phase 2 — Onboarding & Rôles
/onboarding                        → OnboardingScreen
/role-selection                    → RoleSelectionScreen
/seller-type-detail                → SellerTypeDetailScreen
/kyc                               → KycScreen
/profile-setup                     → ProfileSetupScreen

# Phase 3 — Client Achat
/client/home                       → ClientHomeScreen
/categories                        → CategoryScreen
/categories/:id/products           → CategoryProductsScreen
/client/search                     → SearchScreen
/client/search/results             → SearchResultsScreen
/client/product/:id                → ProductDetailScreen
/client/seller/:id                 → SellerProfileScreen
/client/product/:id/reviews         → ReviewsScreen
/client/cart                       → CartScreen
/client/cart/item/:id/edit         → CartItemEditScreen
/client/checkout                   → CheckoutScreen
/client/checkout/address           → CheckoutAddressScreen
/client/checkout/delivery          → CheckoutDeliveryScreen
/client/checkout/payment           → CheckoutPaymentScreen
/client/checkout/review            → CheckoutReviewScreen
/client/checkout/processing        → PaymentProcessingScreen
/client/checkout/failed            → PaymentFailedScreen
/client/product/:id/negotiate      → NegotiateScreen
/client/orders                     → OrdersScreen
/client/orders/:id                 → OrderDetailScreen
/client/orders/:id/tracking        → OrderTrackingScreen
/client/orders/:id/rate            → RateOrderScreen
/client/orders/:id/dispute         → DisputeScreen
/favorites                         → FavoritesScreen

# Phase 5 — Vendeur WhatsApp
/seller/whatsapp                   → SellerWhatsAppScreen
/seller/whatsapp/product/create     → WhatsAppProductCreateScreen
/seller/whatsapp/product/:id/detail → WhatsAppProductDetailScreen
/seller/whatsapp/product/:id/edit   → WhatsAppProductEditScreen
/seller/whatsapp/orders            → WhatsAppOrdersScreen
/seller/whatsapp/orders/:id        → WhatsAppOrderDetailScreen
/seller/whatsapp/stats             → WhatsAppStatsScreen

# Phase 6 — Vendeur Boutique
/seller/boutique                   → SellerBoutiqueScreen
/seller/boutique/analytics         → BoutiqueAnalyticsScreen
/seller/boutique/catalog           → BoutiqueCatalogScreen
/seller/boutique/product/create     → BoutiqueProductCreateScreen
/seller/boutique/product/:id/edit   → BoutiqueProductEditScreen
/seller/boutique/orders            → BoutiqueOrdersScreen
/seller/boutique/orders/:id        → BoutiqueOrderDetailScreen
/seller/boutique/inventory         → BoutiqueInventoryScreen
/seller/boutique/wallet            → BoutiqueWalletScreen
/seller/boutique/settings          → BoutiqueSettingsScreen

# Phase 7 — Vendeur Rapide
/rapid                             → RapidDashboardScreen
/rapid/publish                     → RapidPublishScreen
/rapid/feed                        → RapidFeedScreen
/rapid/product/:id                 → RapidProductDetailScreen
/rapid/promotions                  → RapidPromotionsScreen
/rapid/flash-sales                 → RapidFlashSalesScreen
/rapid/messages                    → RapidMessagesScreen
/rapid/analytics                   → RapidAnalyticsScreen

# Phase 8 — Livreur
/driver                            → DriverDashboardScreen
/driver/zone                       → DriverZoneScreen
/driver/earnings                   → DriverEarningsScreen
/driver/wallet                     → DriverWalletScreen
/driver/profile                    → DriverProfileScreen
/driver/request/:id                → NewDeliveryRequestScreen
/driver/navigation/:id             → DeliveryNavigationScreen
/driver/pickup/:id                 → DeliveryPickupScreen
/driver/dropoff/:id                → DeliveryDropoffScreen

# Phase 9 — Chat
/chat                              → ChatListScreen
/chat/:id                          → ChatDetailScreen
/support-chat                      → SupportChatScreen

# Phase 10 — Profil
/profile                           → ProfileScreen
/profile/edit                      → EditProfileScreen
/profile/language                  → LanguageScreen
/profile/low-data                  → LowDataModeScreen
/profile/notification-settings     → NotificationSettingsScreen
/profile/privacy-security          → PrivacySecurityScreen
/profile/payment-methods           → PaymentMethodsScreen
/profile/address-book              → AddressBookScreen
/profile/referral                  → ReferralScreen
/profile/about                     → AboutScreen
/profile/delete-account            → DeleteAccountScreen
/help                              → HelpScreen
/profile/accessibility             → AccessibilitySettingsScreen

# Phase 11 — Notifications
/notifications                     → NotificationsScreen
/notifications/:id                 → NotificationDetailScreen

# Phase 12 — Admin
/admin                             → AdminDashboardScreen
/admin/users                       → AdminUsersScreen
/admin/orders                      → AdminOrdersScreen
/admin/kyc                         → AdminKycScreen

# Phase 13 — Polish
/onboarding-tutorial               → OnboardingTutorialScreen
/rate-app                          → RateAppScreen
/whats-new                         → WhatsNewScreen
/app-update                        → AppUpdateScreen
```

---

## 5. i18n / Localisation

### Configuration

- **Fichiers ARB** : `lib/l10n/app_en.arb` (EN), `lib/l10n/app_fr.arb` (FR)
- **Génération** : `flutter gen-l10n` via `l10n.yaml`
- **Output** : `lib/l10n/app_localizations.dart` (5775 lignes)
- **Getter style** : snake_case (ex: `AppLocalizations.of(context).checkout_success`)
- **nullable-getter** : `false` → retour non-nullable, pas de `!` nécessaire
- **Clés totales** : ~897 (FR + EN)

### Catégories de clés

| Préfixe | Exemples | Contexte |
|---------|----------|---------|
| `app_` | `app_name`, `app_tagline` | Méta |
| `nav_` | `nav_home`, `nav_search`, `nav_sell`, `nav_cart`, `nav_profile` | Navigation |
| `general_` | `general_save`, `general_cancel`, `general_skip`, `general_next`, `general_share` | Boutons génériques |
| `auth_` | `auth_welcome`, `auth_phone_hint`, `auth_otp_title` | Authentification |
| `onboarding_` | `onboarding_start`, `onboarding_step1_title` | Onboarding |
| `role_` | `role_client`, `role_seller`, `role_driver` | Sélection rôle |
| `seller_type_` | `seller_type_whatsapp`, `seller_type_boutique`, `seller_type_rapid` | Types vendeur |
| `kyc_` | `kyc_selfie`, `kyc_id_front`, `kyc_verified` | Vérification KYC |
| `product_` | `product_detail`, `product_add_to_cart`, `product_reviews` | Produits |
| `category_` | `category_fashion`, `category_electronics`, `category_food` | Catégories |
| `search_` | `search_hint`, `search_results`, `search_filters` | Recherche |
| `cart_` | `cart_title`, `cart_empty`, `cart_checkout` | Panier |
| `checkout_` | `checkout_address`, `checkout_payment`, `checkout_success`, `checkout_orange_money` | Checkout |
| `order_` | `order_status`, `order_total`, `order_tracking`, `order_rate` | Commandes |
| `delivery_` | `delivery_standard`, `delivery_express`, `delivery_pickup` | Livraison |
| `chat_` | `chat_title`, `chat_input_hint`, `chat_offer_title` | Chat |
| `seller_` | `seller_whatsapp_dashboard`, `seller_boutique_analytics` | Vendeur |
| `boutique_` | `boutique_catalog`, `boutique_inventory`, `boutique_wallet` | Boutique |
| `rapid_` | `rapid_dashboard`, `rapid_publish`, `rapid_promotions` | Rapide |
| `driver_` | `driver_dashboard_online`, `driver_earnings`, `driver_wallet` | Livreur |
| `wallet_` | `wallet_balance`, `wallet_withdraw`, `wallet_history` | Portefeuille |
| `profile_` | `profile_edit`, `profile_language`, `profile_notifications` | Profil |
| `settings_` | `settings_low_data`, `settings_accessibility`, `settings_privacy` | Paramètres |
| `notification_` | `notifications_title`, `notification_detail`, `notifications_type_order` | Notifications |
| `admin_` | `admin_dashboard`, `admin_users`, `admin_orders`, `admin_kyc` | Admin |
| `tutorial_` | `tutorial_step1`, `tutorial_step2`, `tutorial_step3`, `tutorial_step4` | Tutoriel |
| `rate_` | `rate_title`, `rate_submit`, `rate_thanks` | Évaluation app |
| `whats_new_` | `whats_new_title`, `whats_new_feature1`, `whats_new_feature2` | Nouveautés |
| `app_update_` | `app_update_title`, `app_update_button`, `app_update_later` | Mise à jour |
| `help_` | `help_title`, `help_faq`, `help_contact` | Aide |
| `errors_` | `error_network`, `error_generic`, `error_retry` | Erreurs |
| `time_` | `time_just_now`, `time_minutes_ago`, `time_yesterday`, `time_date_format` | Temps |
| `currency_` | `currency_fcfa`, `currency_symbol` | Monnaie |
| `filter_` | `filter_price_range`, `filter_category`, `filter_sort` | Filtres |

---

## 6. Assets

### Logo (6 fichiers SVG)

| Fichier | Usage |
|---------|-------|
| `assets/logo/okiba_mark.svg` | Mark seul (splash, app bar) |
| `assets/logo/okiba_logo_horizontal.svg` | Mark + OKIBA horizontal (headers) |
| `assets/logo/okiba_logo_vertical.svg` | Mark + OKIBA vertical (onboarding) |
| `assets/logo/okiba_app_icon.svg` | Mark dans carré arrondi (icône app) |
| `assets/logo/okiba_app_icon_dark.svg` | Variante dark mode |
| `assets/logo/okiba_mark_monochrome.svg` | Mark monochrome (empty states, watermarks) |

### Animations Lottie (8 fichiers)

| Fichier | Type | Usage |
|---------|------|-------|
| `splash_success.json` | splashSuccess | SplashScreen |
| `payment_success.json` | paymentSuccess | Confirmation checkout |
| `loading_dots.json` | loadingDots | Écrans loading |
| `empty_state.json` | emptyState | Empty states |
| `error_state.json` | errorState | Écrans erreur |
| `order_delivered.json` | orderDelivered | Confirmation livraison |
| `new_message.json` | newMessage | Nouveau message chat |
| `driver_arriving.json` | driverArriving | Livreur en approche |

### Icônes SVG (80+ fichiers)

| Catégorie | Nombre | Fichiers |
|-----------|--------|----------|
| Tab Bar | 10 | home, search, sell, cart, profile + variants _filled |
| Catégories | 8 | fashion, electronics, home_goods, auto, services, beauty, sports, food |
| Paiement | 5 | orange_money, mtn_momo, airtel_money, cash, card |
| Statuts | 7 | pending, confirmed, preparing, ready, in_transit, delivered, cancelled |
| Livraison | 7 | motorcycle, car, pickup, dropoff, qr_scan, navigation, location_pin |
| Divers | 51 | whatsapp, share, heart, star, check, close, arrow_*, edit, delete, notification, settings, help, logout, truck, verified, badge badges, etc. |

### Images PNG (21 fichiers)

| Catégorie | Nombre | Fichiers |
|-----------|--------|----------|
| Onboarding | 4 | onboarding_1.png à onboarding_4.png |
| Empty States | 8 | empty_cart, empty_orders, empty_search, empty_notifications, empty_chat, empty_favorites, empty_products, empty_delivery |
| Erreurs | 4 | error_network, error_server, error_not_found, error_generic |
| Illustrations | 5 | payment_success, order_confirmed, kyc_verified, welcome_hero, support_hero |
| Backgrounds | 2 | pattern_kente, pattern_geometric |

### Fonts (5 fichiers Inter)

| Fichier | Poids |
|---------|-------|
| `Inter-Regular.ttf` | 400 |
| `Inter-Medium.ttf` | 500 |
| `Inter-SemiBold.ttf` | 600 |
| `Inter-Bold.ttf` | 700 |
| `Inter-ExtraBold.ttf` | 800 |

---

## 7. Dépendances

### Production (25 packages)

| Package | Version | Usage |
|---------|---------|-------|
| `flutter` | SDK | Framework UI |
| `go_router` | ^17.2.3 | Navigation (99 routes) |
| `flutter_bloc` | ^9.1.1 | State management |
| `google_fonts` | ^8.1.0 | Typographie Inter |
| `flutter_svg` | ^2.0.10 | Rendu SVG (logo + icônes) |
| `lottie` | ^3.1.2 | Animations Lottie |
| `shimmer` | ^3.0.0 | Skeleton loading |
| `cached_network_image` | ^3.4.1 | Cache images réseau |
| `firebase_core` | ^4.9.0 | Firebase core |
| `firebase_auth` | ^6.5.1 | Auth (Phone OTP) |
| `cloud_firestore` | ^6.0.0 | Firestore DB |
| `firebase_storage` | ^13.0.0 | Upload images |
| `firebase_messaging` | ^16.2.2 | Push notifications |
| `firebase_analytics` | ^12.4.1 | Analytics |
| `hive` / `hive_flutter` | ^2.2.3 | Cache offline local |
| `google_maps_flutter` | ^2.14.2 | Cartographie livraison |
| `geolocator` | ^14.0.2 | GPS localisation |
| `flutter_polyline_points` | ^3.1.0 | Itinéraires map |
| `intl` | ^0.20.2 | Internationalisation |
| `image_picker` | ^1.1.2 | Caméra / Galerie |
| `share_plus` | ^12.0.2 | Partage liens |
| `url_launcher` | ^6.3.0 | Ouverture URL/téléphone |
| `connectivity_plus` | ^7.1.1 | Détection hors ligne |
| `flutter_localizations` | SDK | Support l10n |
| `cupertino_icons` | ^1.0.8 | Icônes iOS |

### Dev (2 packages)

| Package | Version |
|---------|---------|
| `flutter_test` | SDK |
| `flutter_lints` | ^6.0.0 |

---

## 8. Constantes & Design System

### Palette de couleurs (90 constantes)

**Primaire** : Forêt Gabonaise `#1B5E3F`  
**Secondaire** : Chaleur Soleil `#E8913A`  
**Tertiaire** : Terre Racines `#8D6E63`  
**Background light** : `#FAFAF7` | **Dark** : `#0C0A09`

| Groupe | Constantes |
|--------|-----------|
| Palette primaire | primary, onPrimary, primaryContainer, onPrimaryContainer |
| Palette secondaire | secondary, onSecondary, secondaryContainer, onSecondaryContainer |
| Palette tertiaire | tertiary, onTertiary, tertiaryContainer, onTertiaryContainer |
| Surface | surface, onSurface, surfaceVariant, onSurfaceVariant, background, onBackground, outline, outlineVariant |
| Sémantique | error, success, warning, info + on* + *Container |
| Dark mode | 22 variantes *Dark |
| Marques | verified, star, whatsapp, orangeMoney, mtnMoney, airtelMoney, cardGeneric |

### Grille d'espacement (75 constantes)

- **Spacing (8pt grid)** : space4 → space64 (10 niveaux)
- **Border radius** : radius8, radius12, radius16, radius20, radiusFull (999)
- **Touch targets** : touchMin (56dp), touchCompact (48dp)
- **Animations** : durationMicro (150ms), durationFast (200ms), durationNormal (300ms), durationSlow (400ms)
- **Font sizes** : textXs (12) → textDisplay (28)
- **Price sizes** : priceSm (16) → priceXl (28)

### API Endpoints (44 constantes)

- Base URL : `https://api.okiba.ga/v1`
- Auth (4), Products (3), Orders (3), Payments (3), Delivery (3), Wallet (3), Chat (2), Notifications (2)

---

## 9. Services

| Service | Fichier | Fonctionnalités |
|---------|---------|-----------------|
| `NotificationService` | `core/services/notification_service.dart` | Permission FCM, get token, écoute messages |
| `LocationService` | `core/services/location_service.dart` | Position GPS, permission handling, accuracy high, distance filter 10m |
| `PushNotificationHandler` | `core/services/push_notification_handler.dart` | Singleton, 9 types enum, gestion tap callbacks |
| `ConnectivityService` | `core/services/connectivity_service.dart` | `ValueNotifier<bool> isOnline`, subscription management |

---

## 10. Data Layer

### Modèles (5)

| Modèle | Fichier | Champs clés |
|--------|---------|-------------|
| `UserModel` | `data/models/user_model.dart` | id, name, phone, email, photo, role (enum 5), status (enum 3) |
| `ProductModel` | `data/models/product_model.dart` | id, name, description, price, images[], category, condition (enum 4), status (enum 3), variants[] |
| `OrderModel` | `data/models/order_model.dart` | id, items[], buyer, seller, delivery, payment, status (enum 13), timeline[] |
| `PaymentModel` | `data/models/payment_model.dart` | id, method, amount, status (enum 5), transactionId |
| `DeliveryJobModel` | `data/models/delivery_model.dart` | id, order, driver, pickup, dropoff, route, status (enum 5) |

### Datasources (2)

| Datasource | Fichier | Technologie |
|------------|---------|-------------|
| `RemoteDataSource` | `data/datasources/remote_datasource.dart` | Firebase Auth + Firestore + Storage |
| `LocalDataSource` | `data/datasources/local_datasource.dart` | Hive (user, products, cart) |

### Repositories (3)

| Repository | Fichier | Sources |
|------------|---------|---------|
| `AuthRepository` | `data/repositories/auth_repository.dart` | Firebase Auth + Local Hive |
| `ProductRepository` | `data/repositories/product_repository.dart` | Firestore + Hive cache |
| `OrderRepository` | `data/repositories/order_repository.dart` | Firestore |

### Domain (5 fichiers)

- **Entities** : UserEntity, ProductEntity, OrderEntity
- **Use Cases** : GetProducts, PlaceOrder

---

## 11. Widgets réutilisables

### Core Widgets (9)

| Widget | Fichier | Variants / Props |
|--------|---------|------------------|
| `OkibaLogo` | `core/widgets/okiba_logo.dart` | 6 variants + 6 tailles + color override + animation scale |
| `OkibaIcon` | `core/widgets/okiba_icon.dart` | 6 catégories + size + color + filled |
| `OkibaAnimation` | `core/widgets/okiba_animation.dart` | 8 types + size + repeat + onComplete |
| `OkibaImage` | `core/widgets/okiba_image.dart` | network/asset/svg + cache + placeholder + error + borderRadius |
| `EmptyStateImage` | `core/widgets/empty_state_image.dart` | 9 types + size + fallback logo monochrome |
| `OnboardingImage` | `core/widgets/onboarding_image.dart` | 4 steps + size + fallback logo animé |
| `SkeletonWidget` | `core/widgets/skeleton_widget.dart` | Shimmer avec w/h/radius configurables |
| `AppButton` | `core/widgets/app_button.dart` | filled/outlined/text/whatsApp + loading + icon |
| `AnimatedListItem` | `core/widgets/animated_list_item.dart` | Fade + slide, staggered, respecte reduced-motion |

### Client Widgets (9)

| Widget | Fichier | Usage |
|--------|---------|-------|
| `ProductCard` | `client/widgets/product_card.dart` | Home, search, category, seller profile, favorites |
| `CartItemCard` | `client/widgets/cart_item_card.dart` | Cart screen |
| `CategoryChip` | `client/widgets/category_chip.dart` | Home, search, results |
| `ProductImageGallery` | `client/widgets/product_image_gallery.dart` | Product detail |
| `PaymentMethodCard` | `client/widgets/payment_method_card.dart` | Checkout, payment methods |
| `SellerInfoCard` | `client/widgets/seller_info_card.dart` | Product detail |
| `OrderCard` | `client/widgets/order_card.dart` | Orders list |
| `FilterBottomSheet` | `client/widgets/filter_bottom_sheet.dart` | Search, results |
| `AddressCard` | `client/widgets/address_card.dart` | Checkout, address book |

### Shared Widgets (3)

| Widget | Fichier | Usage |
|--------|---------|-------|
| `BottomNavBar` | `shared/widgets/bottom_nav_bar.dart` | Navigation principale 5 onglets |
| `AppBarOkiba` | `shared/widgets/app_bar_okiba.dart` | AppBar configurable (logo/actions/styles) |
| `BaseScaffold` | `shared/widgets/base_scaffold.dart` | Scaffold composite |

### Chat Widgets (1)

| Widget | Fichier | Usage |
|--------|---------|-------|
| `ChatOfferBubble` | `chat/widgets/chat_offer_bubble.dart` | Bulle offre prix avec Accept/Refuse/Counter |

### Notification Widgets (1)

| Widget | Fichier | Usage |
|--------|---------|-------|
| `InAppNotificationBanner` | `notifications/widgets/in_app_notification_banner.dart` | Bannière overlay 4s |

---

## 12. État actuel & Roadmap

### ✅ Réalisé

- Tous les écrans implémentés (101 screens, 14 phases)
- Navigation complète (99 routes GoRouter)
- i18n FR/EN complète (~897 clés ARB)
- Assets intégrés (6 widgets réutilisables, 130+ fichiers placeholders)
- Design system Material 3 complet (couleurs, espacement, typographie)
- Data layer (modèles, datasources, repositories, entités, use cases)
- Services (notification, location, connectivity, push handler)
- Formateurs, validateurs, haptiques
- `flutter analyze` — 0 erreurs
- `flutter test` — all passed
- `flutter build apk --debug` — BUILD SUCCESSFUL

### ❌ Non réalisé (backlog)

**Firebase :**
- `google-services.json` / `GoogleService-Info.plist` non configuré
- Firestore collections non connectées (données statiques)
- Firebase Auth (Phone OTP) non branché
- Firebase Storage (upload images) non branché
- Firebase Cloud Messaging (push) non branché
- Firebase Analytics non branché
- Cloud Functions non écrites (paiement, notifications, escrow)

**Paiement :**
- API Orange Money, MTN MoMo, Airtel Money non intégrées
- Logique de paiement simulée (statique)

**Cartographie :**
- Google Maps SDK non configuré (clé API manquante)
- Itinéraires, géocodage, directions non implémentés

**Assets :**
- 130+ fichiers placeholders à remplacer par les fichiers réels (animations Lottie, icônes SVG, images PNG, fonts Inter)

**Tests :**
- Tests unitaires : uniquement widget test placeholder
- Tests d'intégration : aucun
- Tests UI (golden) : aucun
- Tests de performance : aucun

**CI/CD & DevOps :**
- GitHub Actions non configuré
- Fastlane non configuré
- Firebase App Distribution non configuré
- Crashlytics/Sentry non configuré
- Code coverage non configuré

**Sécurité :**
- `flutter_secure_storage` non configuré
- Certificate pinning non configuré
- Obfuscation non configurée
- Root/jailbreak detection non configuré

---

> **Document vivant** — Dernière mise à jour : 2026-05-21
