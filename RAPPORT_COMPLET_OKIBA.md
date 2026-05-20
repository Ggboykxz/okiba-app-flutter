# RAPPORT COMPLET OKIBA — Écarts & Plan de Finalisation

> **App :** Okiba — Le Marché Gabonais  
> **Statut actuel :** 27 écrans fonctionnels, 81 fichiers Dart, build OK  
> **Objectif :** 111 écrans complets, production-ready  
> **Date :** 2026-05-20  
> **Version :** 1.0.0

---

## PARTIE 1 — ÉCRANS MANQUANTS (84 écrans)

### Analyse des 14 phases

| Phase | Total prévu | Implémentés | Manquants | Statut |
|-------|-------------|-------------|-----------|--------|
| 0 — Fondation | 10 | ~10 | 0 | ✅ Complet |
| 1 — Auth | 8 | 8 | 0 | ✅ Complet |
| 2 — Onboarding | 5 | 3 | 2 | ⚠️ Partiel |
| 3 — Client Achat | 18 | ~6 | 12 | 🔴 Incomplet |
| 4 — Client Post-Achat | 6 | 2 | 4 | 🔴 Incomplet |
| 5 — Vendeur WhatsApp | 7 | 1 | 6 | 🔴 Incomplet |
| 6 — Vendeur Boutique | 10 | 1 | 9 | 🔴 Incomplet |
| 7 — Vendeur Rapide | 8 | 3 | 5 | 🔴 Incomplet |
| 8 — Livreur | 9 | 1 | 8 | 🔴 Incomplet |
| 9 — Chat | 4 | 2 | 2 | ⚠️ Partiel |
| 10 — Profil | 12 | 5 | 7 | 🔴 Incomplet |
| 11 — Notifications | 5 | 1 | 4 | 🔴 Incomplet |
| 12 — Admin | 4 | 0 | 4 | 🔵 V1.1 |
| 13 — Polish | 5 | 0 | 5 | 🔵 V1.1 |
| **TOTAL** | **111** | **~43** | **68** | |

---

## PARTIE 2 — DÉTAIL ÉCRANS MANQUANTS PAR PHASE

### Phase 2 — Onboarding & Rôles (2 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 2.4 | `SellerTypeDetailScreen` | `seller_type_detail_screen.dart` | 🔴 Bloquant | Explication 3 modes vendeur avec comparaison visuelle |
| 2.5 | `KycScreen` | `kyc_screen.dart` | 🔴 Bloquant | Selfie + photo ID recto/verso, upload Firebase, blur detection |

**Impact :** Sans KYC, les vendeurs et livreurs ne peuvent pas être vérifiés. Pas de badge "Vérifié" = pas de confiance.

---

### Phase 3 — Client : Parcours Achat (12 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 3.2 | `CategoryScreen` | `client/home/screens/category_screen.dart` | 🟡 Core | Grille 3-4 colonnes catégories icon-first |
| 3.3 | `CategoryProductsScreen` | `client/home/screens/category_products_screen.dart` | 🟡 Core | Produits d'une catégorie, grille 2 colonnes |
| 3.5 | `SearchResultsScreen` | `client/search/screens/search_results_screen.dart` | 🟡 Core | Résultats recherche avec filtres bottom sheet |
| 3.7 | `SellerProfileScreen` | `client/product/screens/seller_profile_screen.dart` | 🟡 Core | Profil vendeur depuis fiche produit |
| 3.8 | `ReviewsScreen` | `client/product/screens/reviews_screen.dart` | 🟡 Core | Tous les avis d'un produit/vendeur |
| 3.10 | `CartItemEditScreen` | `client/cart/screens/cart_item_edit_screen.dart` | 🟡 Core | Modifier quantité/variants/note dans panier |
| 3.11 | `CheckoutAddressScreen` | `client/checkout/screens/checkout_address_screen.dart` | 🔴 Bloquant | Step 1 : Adresse livraison (GPS + texte) |
| 3.12 | `CheckoutDeliveryScreen` | `client/checkout/screens/checkout_delivery_screen.dart` | 🔴 Bloquant | Step 2 : Mode livraison (Standard/Express/Retrait) |
| 3.13 | `CheckoutPaymentScreen` | `client/checkout/screens/checkout_payment_screen.dart` | 🔴 Bloquant | Step 3 : Paiement mobile money + cash |
| 3.14 | `CheckoutReviewScreen` | `client/checkout/screens/checkout_review_screen.dart` | 🔴 Bloquant | Step 4 : Récapitulatif complet avant validation |
| 3.15 | `PaymentProcessingScreen` | `client/checkout/screens/payment_processing_screen.dart` | 🔴 Bloquant | Animation attente confirmation paiement |
| 3.17 | `PaymentFailedScreen` | `client/checkout/screens/payment_failed_screen.dart` | 🔴 Bloquant | Échec paiement + retry + suggestion alternative |
| 3.18 | `NegotiateScreen` | `client/product/screens/negotiate_screen.dart` | 🟢 MVP | Négocier prix depuis fiche produit |

**Impact :** Sans le checkout complet (4 steps + processing + failed), aucun achat ne peut être finalisé. C'est le cœur du business model.

---

### Phase 4 — Client : Post-Achat (4 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 4.3 | `OrderTrackingScreen` | `client/orders/screens/order_tracking_screen.dart` | 🟡 Core | Map temps réel position livreur |
| 4.4 | `RateOrderScreen` | `client/orders/screens/rate_order_screen.dart` | 🟡 Core | Évaluation vendeur + livreur + commentaire |
| 4.5 | `DisputeScreen` | `client/orders/screens/dispute_screen.dart` | 🟢 MVP | Ouvrir litige, upload preuves |
| 4.6 | `FavoritesScreen` | `client/home/screens/favorites_screen.dart` | 🟢 MVP | Liste produits favoris, sync cross-device |

**Impact :** Sans tracking et rating, pas de boucle de confiance. Les utilisateurs n'achèteront pas sans savoir où est leur colis.

---

### Phase 5 — Vendeur : Mode WhatsApp (6 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 5.2 | `WhatsAppProductCreateScreen` | `seller/whatsapp/screens/whatsapp_product_create_screen.dart` | 🔴 Bloquant | Créer produit : 1-5 photos, prix, description voice |
| 5.3 | `WhatsAppProductDetailScreen` | `seller/whatsapp/screens/whatsapp_product_detail_screen.dart` | 🔴 Bloquant | Fiche produit vendeur : lien copiable, QR code, toggle stock |
| 5.4 | `WhatsAppProductEditScreen` | `seller/whatsapp/screens/whatsapp_product_edit_screen.dart` | 🟡 Core | Modifier produit WhatsApp |
| 5.5 | `WhatsAppOrdersScreen` | `seller/whatsapp/screens/whatsapp_orders_screen.dart` | 🔴 Bloquant | Commandes reçues via liens WhatsApp |
| 5.6 | `WhatsAppOrderDetailScreen` | `seller/whatsapp/screens/whatsapp_order_detail_screen.dart` | 🔴 Bloquant | Détail commande WhatsApp, actions vendeur |
| 5.7 | `WhatsAppStatsScreen` | `seller/whatsapp/screens/whatsapp_stats_screen.dart` | 🟢 MVP | Stats vues/clics/ventes 7j/30j/90j |

**Impact :** Sans création de produit et gestion commandes, le mode WhatsApp est inutilisable. C'est le mode le plus simple pour les vendeurs débutants.

---

### Phase 6 — Vendeur : Mode Boutique (9 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 6.2 | `BoutiqueAnalyticsScreen` | `seller/boutique/screens/boutique_analytics_screen.dart` | 🟡 Core | Ventes, revenus, produits populaires, période |
| 6.3 | `BoutiqueCatalogScreen` | `seller/boutique/screens/boutique_catalog_screen.dart` | 🔴 Bloquant | Liste produits, recherche, filtres, actions rapides |
| 6.4 | `BoutiqueProductCreateScreen` | `seller/boutique/screens/boutique_product_create_screen.dart` | 🔴 Bloquant | Multi-photos, variants, SKU, stock, dimensions |
| 6.5 | `BoutiqueProductEditScreen` | `seller/boutique/screens/boutique_product_edit_screen.dart` | 🟡 Core | Modifier produit boutique |
| 6.6 | `BoutiqueOrdersScreen` | `seller/boutique/screens/boutique_orders_screen.dart` | 🔴 Bloquant | Tabs par statut, actions vendeur |
| 6.7 | `BoutiqueOrderDetailScreen` | `seller/boutique/screens/boutique_order_detail_screen.dart` | 🔴 Bloquant | Détail commande boutique, timeline |
| 6.8 | `BoutiqueInventoryScreen` | `seller/boutique/screens/boutique_inventory_screen.dart` | 🟡 Core | Stock, alertes rupture, ajustement |
| 6.9 | `BoutiqueWalletScreen` | `seller/boutique/screens/boutique_wallet_screen.dart` | 🔴 Bloquant | Solde FCFA, retrait mobile money/compte bancaire |
| 6.10 | `BoutiqueSettingsScreen` | `seller/boutique/screens/boutique_settings_screen.dart` | 🟡 Core | Nom, description, logo, bannière, horaires, zone |

**Impact :** Sans catalogue, création produit, commandes et wallet, la boutique est un écran statique sans action possible.

---

### Phase 7 — Vendeur : Mode Rapide/Vinted (5 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 7.2 | `RapidPublishScreen` (Step 1) | `seller/rapid/screens/rapid_publish_screen.dart` | ⚠️ Existe mais incomplet | Caméra native avec overlay guides, 1-8 photos |
| 7.3 | `RapidPublishPriceScreen` (Step 2) | `seller/rapid/screens/rapid_publish_price_screen.dart` | 🔴 Manquant | Clavier numérique gros, prix FCFA, suggestion auto |
| 7.4 | `RapidPublishCategoryScreen` (Step 3) | `seller/rapid/screens/rapid_publish_category_screen.dart` | 🔴 Manquant | Catégories icon-first 3 colonnes |
| 7.5 | `RapidPublishConditionScreen` (Step 4) | `seller/rapid/screens/rapid_publish_condition_screen.dart` | 🔴 Manquant | 4 niveaux état avec icônes |
| 7.6 | `RapidPublishConfirmScreen` (Step 5) | `seller/rapid/screens/rapid_publish_confirm_screen.dart` | 🔴 Manquant | Récap avant publication |
| 7.8 | `RapidProductDetailScreen` | `seller/rapid/screens/rapid_product_detail_screen.dart` | 🟡 Core | Fiche produit occasion, "Faire une offre" |

**Impact :** La publication rapide doit être en 5 steps clairs. Actuellement c'est un seul écran qui mélange tout.

---

### Phase 8 — Livreur (8 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 8.2 | `DriverZoneScreen` | `driver/screens/driver_zone_screen.dart` | 🟡 Core | Map zone travail, polygon sélectionnable |
| 8.3 | `DriverEarningsScreen` | `driver/screens/driver_earnings_screen.dart` | 🟡 Core | Revenus jour/semaine/mois, graphique |
| 8.4 | `DriverWalletScreen` | `driver/screens/driver_wallet_screen.dart` | 🔴 Bloquant | Solde, retrait instantané mobile money |
| 8.5 | `DriverProfileScreen` | `driver/screens/driver_profile_screen.dart` | 🟡 Core | Photo, niveau, note, véhicule, documents |
| 8.6 | `NewDeliveryRequestScreen` | `driver/screens/new_delivery_request_screen.dart` | 🔴 Bloquant | Bottom sheet course, timer 15s, prix/distance |
| 8.7 | `DeliveryNavigationScreen` | `driver/screens/delivery_navigation_screen.dart` | 🔴 Bloquant | Map itinéraire vendeur → client |
| 8.8 | `DeliveryPickupScreen` | `driver/screens/delivery_pickup_screen.dart` | 🔴 Bloquant | Scan QR vendeur, photo colis |
| 8.9 | `DeliveryDropoffScreen` | `driver/screens/delivery_dropoff_screen.dart` | 🔴 Bloquant | Scan QR client, photo preuve, signature |

**Impact :** Sans wallet, request, navigation, pickup et dropoff, le livreur ne peut pas gagner d'argent. L'écran dashboard actuel est juste un tableau de bord statique.

---

### Phase 9 — Chat (2 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 9.3 | `ChatOfferBubble` | `chat/widgets/chat_offer_bubble.dart` | 🟡 Core | Bulle spéciale offre prix avec Accept/Refuse/Counter |
| 9.4 | `SupportChatScreen` | `chat/screens/support_chat_screen.dart` | 🟢 MVP | Chat avec support Okiba, tickets |

**Impact :** Sans l'offre bubble, pas de négociation. Sans support chat, pas de résolution litiges.

---

### Phase 10 — Profil & Paramètres (7 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 10.3 | `AddressesScreen` | `profile/screens/addresses_screen.dart` | 🟡 Core | Liste adresses sauvegardées, défaut |
| 10.4 | `AddAddressScreen` | `profile/screens/add_address_screen.dart` | 🟡 Core | GPS auto, quartier, point repère |
| 10.5 | `PaymentMethodsScreen` | `profile/screens/payment_methods_screen.dart` | 🔴 Bloquant | Mobile money enregistrés, carte, ajouter/supprimer |
| 10.6 | `NotificationsSettingsScreen` | `profile/screens/notifications_settings_screen.dart` | 🟡 Core | Toggle par type de notification |
| 10.9 | `SecurityScreen` | `profile/screens/security_screen.dart` | 🟢 MVP | Changer password, 2FA, sessions |
| 10.10 | `PrivacyScreen` | `profile/screens/privacy_screen.dart` | 🟢 MVP | Données perso, télécharger, supprimer compte |
| 10.12 | `AboutScreen` | `profile/screens/about_screen.dart` | 🟢 MVP | Version, mentions légales, réseaux sociaux |

**Impact :** Sans adresses et payment methods, le checkout ne peut pas pré-remplir. Sans notifications settings, l'utilisateur se désabonne de tout.

---

### Phase 11 — Notifications (4 manquants)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 11.2 | `NotificationDetailScreen` | `notifications/screens/notification_detail_screen.dart` | 🟡 Core | Détail notification, action associée |
| 11.3 | `PushNotificationHandler` | `core/services/push_notification_handler.dart` | 🔴 Bloquant | Service FCM, routing selon type |
| 11.4 | `InAppNotificationBanner` | `notifications/widgets/in_app_notification_banner.dart` | 🟡 Core | Banner slide from top, auto-dismiss |
| 11.5 | `NotificationSettingsScreen` | `notifications/screens/notification_settings_screen.dart` | 🟡 Core | Granulaire par type, heures silencieuses |

**Impact :** Sans FCM handler, pas de push notifications. Sans in-app banner, l'utilisateur ne voit rien quand l'app est ouverte.

---

### Phase 12 — Admin & Support (4 manquants — V1.1)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 12.1 | `AdminDashboardScreen` | `admin/screens/admin_dashboard_screen.dart` | 🔵 V1.1 | Stats globales utilisateurs/commandes/revenus |
| 12.2 | `AdminUsersScreen` | `admin/screens/admin_users_screen.dart` | 🔵 V1.1 | Liste users, filtres rôle/statut, suspendre |
| 12.3 | `AdminOrdersScreen` | `admin/screens/admin_orders_screen.dart` | 🔵 V1.1 | Toutes commandes, litiges, remboursements |
| 12.4 | `AdminKycScreen` | `admin/screens/admin_kyc_screen.dart` | 🔵 V1.1 | Files KYC en attente, approuver/rejeter |

---

### Phase 13 — Polish & Optimisation (5 manquants — V1.1)

| # | Écran | Fichier | Priorité | Description |
|---|-------|---------|----------|-------------|
| 13.1 | `OnboardingTutorialScreen` | `shared/screens/onboarding_tutorial_screen.dart` | 🔵 V1.1 | Overlay fléché première utilisation |
| 13.2 | `RateAppScreen` | `shared/screens/rate_app_screen.dart` | 🔵 V1.1 | "Vous aimez Okiba ?" 5 étoiles |
| 13.3 | `WhatsNewScreen` | `shared/screens/whats_new_screen.dart` | 🔵 V1.1 | Nouveautés version, carousel |
| 13.4 | `AccessibilitySettingsScreen` | `profile/screens/accessibility_settings_screen.dart` | 🔵 V1.1 | Taille texte, contraste, réduire motion |
| 13.5 | `AppUpdateScreen` | `shared/screens/app_update_screen.dart` | 🔵 V1.1 | Nouvelle version, changelog, update |

---

## PARTIE 3 — WIDGETS MANQUANTS

| # | Widget | Fichier | Usage | Priorité |
|---|--------|---------|-------|----------|
| W1 | `PriceText` | `core/widgets/price_text.dart` | Affichage prix FCFA formaté partout | 🔴 Bloquant |
| W2 | `AnimatedListItem` | `core/widgets/animated_list_item.dart` | Stagger animation lists | 🟡 Core |
| W3 | `AppHaptics` | `core/utils/haptics.dart` | Helper haptic feedback | 🟡 Core |
| W4 | `OfflineBanner` | `core/widgets/offline_banner.dart` | Banner mode hors connexion | 🔴 Bloquant |
| W5 | `VoiceInputButton` | `shared/widgets/voice_input_button.dart` | Micro pour voice input | 🟢 MVP |
| W6 | `WhatsAppButton` | `shared/widgets/whatsapp_button.dart` | Bouton vert WhatsApp style | 🟡 Core |
| W7 | `StatusBadge` | `shared/widgets/status_badge.dart` | Badge statut commande coloré | 🟡 Core |
| W8 | `TimelineStepper` | `shared/widgets/timeline_stepper.dart` | Timeline verticale suivi commande | 🟡 Core |
| W9 | `ImagePickerGrid` | `shared/widgets/image_picker_grid.dart` | Grille photos produit avec ajout/suppression | 🔴 Bloquant |
| W10 | `FCMTokenManager` | `core/services/fcm_token_manager.dart` | Gestion token FCM, topics | 🔴 Bloquant |
| W11 | `ImageCacheManager` | `core/services/image_cache_manager.dart` | Cache images, compression, WebP | 🟡 Core |
| W12 | `LocationService` | `core/services/location_service.dart` | GPS, géocodage, zone | 🟡 Core |
| W13 | `PaymentService` | `core/services/payment_service.dart` | Orange/MTN/Airtel API, polling | 🔴 Bloquant |
| W14 | `EscrowService` | `core/services/escrow_service.dart` | Gestion fonds sécurisés | 🔴 Bloquant |
| W15 | `DeepLinkHandler` | `core/services/deep_link_handler.dart` | Liens produits partagés | 🟡 Core |

---

## PARTIE 4 — SERVICES & BACKEND MANQUANTS

### 4.1 Firebase Configuration

| # | Service | Statut | Action requise |
|---|---------|--------|----------------|
| F1 | `firebase_core` | ⚠️ Configuré ? | Vérifier `google-services.json` / `GoogleService-Info.plist` |
| F2 | `firebase_auth` (Phone OTP) | ⚠️ Partiel | Vérifier callback +241, test numéro réel |
| F3 | `cloud_firestore` | ⚠️ Partiel | Remplacer données statiques par collections |
| F4 | `firebase_storage` | ❌ Manquant | Upload avatar, photos produits |
| F5 | `firebase_messaging` | ❌ Manquant | Push notifications FCM |
| F6 | `firebase_analytics` | ❌ Manquant | Tracking events |
| F7 | `firebase_crashlytics` | ❌ Manquant | Monitoring erreurs |
| F8 | `cloud_functions` | ❌ Manquant | Paiement, escrow, notifications server-side |

### 4.2 Collections Firestore requises

```
users/{userId}
  ├── profile: {name, phone, email, photo, roles[], verified}
  ├── addresses: [{id, label, quarter, landmark, geo}]
  ├── payment_methods: [{type, provider, number_last4, default}]
  └── settings: {language, dark_mode, low_data, notifications}

products/{productId}
  ├── info: {name, description, price, old_price, currency, images[], category, subcategory}
  ├── seller: {id, name, photo, verified}
  ├── stock: {quantity, sku, variants: [{size, color, price, qty}]}
  ├── type: 'boutique' | 'whatsapp' | 'rapid'
  ├── status: 'active' | 'sold' | 'hidden'
  └── metadata: {created_at, updated_at, views, likes}

orders/{orderId}
  ├── buyer: {id, name, phone, address}
  ├── seller: {id, name, phone}
  ├── items: [{product_id, name, image, price, qty, variant}]
  ├── delivery: {mode, fee, address, estimated_date}
  ├── payment: {method, status, transaction_id, amount}
  ├── status: 'pending' → 'confirmed' → 'preparing' → 'ready' → 'picked_up' → 'in_transit' → 'delivered' | 'cancelled'
  ├── timeline: [{status, timestamp, note}]
  └── escrow: {amount_held, released_at, refund_reason}

deliveries/{deliveryId}
  ├── order: {id, ref}
  ├── driver: {id, name, photo, phone, vehicle}
  ├── pickup: {address, geo, qr_code, photo_proof}
  ├── dropoff: {address, geo, qr_code, photo_proof, signature}
  ├── route: {points: [{lat, lng, timestamp}]}
  └── status: 'assigned' → 'accepted' → 'pickup' → 'in_transit' → 'delivered'

chats/{chatId}
  ├── participants: [{user_id, role, name, photo}]
  ├── messages: [{id, sender_id, type, content, timestamp, read_by[]}]
  └── last_message: {text, timestamp, unread_count}

notifications/{notificationId}
  ├── user_id, type, title, body, data: {screen, params}
  ├── read: false, created_at
  └── action_taken: false
```

### 4.3 Cloud Functions requises

| # | Function | Trigger | Description |
|---|----------|---------|-------------|
| CF1 | `processPayment` | HTTPS | Initier paiement mobile money, polling |
| CF2 | `verifyPayment` | Pub/Sub | Vérifier statut transaction opérateur |
| CF3 | `releaseEscrow` | Firestore onUpdate | Libérer fonds vendeur 24h après livraison |
| CF4 | `refundOrder` | HTTPS | Rembourser client sur litige validé |
| CF5 | `sendPushNotification` | Firestore onCreate | Envoyer FCM selon type |
| CF6 | `assignDriver` | Firestore onUpdate | Assigner livreur selon zone/disponibilité |
| CF7 | `updateDriverLocation` | HTTPS | Mettre à jour position temps réel |
| CF8 | `generateProductLink` | HTTPS | Générer lien court produit WhatsApp |
| CF9 | `verifyKyc` | HTTPS | Vérifier selfie + ID, approuver/rejeter |
| CF10 | `calculateDeliveryFee` | HTTPS | Calculer frais selon zone/mode/poids |

---

## PARTIE 5 — INTÉGRATIONS EXTERNES MANQUANTES

### 5.1 Paiement

| # | Service | Statut | Intégration |
|---|---------|--------|-------------|
| P1 | Orange Money API | ❌ | API Orange Money Web Payment / USSD push |
| P2 | MTN Mobile Money | ❌ | API MTN MoMo Collection |
| P3 | Airtel Money | ❌ | API Airtel Money |
| P4 | Cash à la livraison | ⚠️ UI existe | Logique validation livreur |
| P5 | Stripe/Flutterwave | ❌ | Carte bancaire (optionnel V1.1) |

### 5.2 Cartographie

| # | Service | Statut | Intégration |
|---|---------|--------|-------------|
| M1 | Google Maps SDK | ⚠️ Dépendance | Carte livraison, zone travail |
| M2 | Mapbox (alternative) | ❌ | Moins cher, meilleur offline |
| M3 | Geocoding API | ❌ | Adresse → coordonnées |
| M4 | Directions API | ❌ | Itinéraire vendeur → client |

### 5.3 Communication

| # | Service | Statut | Intégration |
|---|---------|--------|-------------|
| C1 | Twilio / Africa's Talking | ❌ | SMS OTP, notifications |
| C2 | Numéros masqués | ❌ | Appel anonyme client-vendeur |
| C3 | WhatsApp Business API | ❌ | Messages automatisés vendeur |

---

## PARTIE 6 — TESTS MANQUANTS

### 6.1 Tests unitaires

| # | Test | Couverture | Priorité |
|---|------|------------|----------|
| T1 | Formatters (prix, téléphone) | 100% | 🔴 |
| T2 | Validators (email, password, phone) | 100% | 🔴 |
| T3 | Auth (login, register, OTP) | 80% | 🔴 |
| T4 | Cart (ajout, suppression, total) | 90% | 🟡 |
| T5 | Checkout (4 steps, validation) | 80% | 🟡 |
| T6 | Payment (mock opérateurs) | 70% | 🟡 |

### 6.2 Tests d'intégration

| # | Test | Scénario | Priorité |
|---|------|----------|----------|
| T7 | Flow complet achat | Recherche → panier → checkout → paiement → suivi | 🔴 |
| T8 | Flow vendeur WhatsApp | Créer → partager → recevoir commande → confirmer | 🔴 |
| T9 | Flow livreur | En ligne → accepter → pickup → livrer → paiement | 🔴 |
| T10 | Offline mode | Couper connexion → naviguer → sync retour | 🟡 |
| T11 | Multi-rôle | Client + Vendeur simultané, switch rapide | 🟡 |

### 6.3 Tests UI (Golden)

| # | Test | Écrans | Priorité |
|---|------|--------|----------|
| T12 | Splash + Auth | Welcome, Register, OTP, Login | 🟡 |
| T13 | Client core | Home, Product, Cart, Checkout | 🟡 |
| T14 | Dark mode | Tous les écrans en dark | 🟡 |
| T15 | Responsive | Petit écran (320dp), tablette (600dp+) | 🟡 |

### 6.4 Tests de performance

| # | Test | Cible | Priorité |
|---|------|-------|----------|
| T16 | Cold start | < 3s | 🔴 |
| T17 | Image loading | < 500ms première image | 🟡 |
| T18 | List scroll | 60fps sur feed 100 items | 🟡 |
| T19 | APK size | < 30MB | 🟡 |
| T20 | Memory usage | < 150MB en usage | 🟡 |

---

## PARTIE 7 — ACCESSIBILITÉ MANQUANTE

| # | Critère | Statut | Action |
|---|---------|--------|--------|
| A1 | Touch targets ≥ 56dp | ⚠️ À vérifier | Audit tous les boutons |
| A2 | Texte minimum 12sp (metadata), 14sp (standard) | ⚠️ À vérifier | Audit typography |
| A3 | Contraste WCAG AA (4.5:1) | ❌ | Vérifier primary/text sur fond |
| A4 | TalkBack/VoiceOver labels | ❌ | Ajouter `semanticLabel` partout |
| A5 | Réduire motion respecté | ❌ | Vérifier `MediaQuery.disableAnimations` |
| A6 | Font size 200% supporté | ❌ | Test overflow texte |
| A7 | Colorblind-friendly | ❌ | Ne pas utiliser couleur seule pour statut |
| A8 | Voice input | ❌ | Micro sur recherche, chat |

---

## PARTIE 8 — SÉCURITÉ MANQUANTE

| # | Critère | Statut | Action |
|---|---------|--------|--------|
| S1 | Stockage sécurisé tokens | ❌ | `flutter_secure_storage` pour JWT |
| S2 | Certificate pinning | ❌ | SSL pinning API opérateurs |
| S3 | Obfuscation code | ❌ | `--obfuscate --split-debug-info` build |
| S4 | Root/jailbreak detection | ❌ | `jailbreak_root_detection` |
| S5 | Screenshot prevention (paiement) | ❌ | `FLAG_SECURE` Android / iOS equivalent |
| S6 | Input validation serveur | ❌ | Toutes les validations doivent être server-side |
| S7 | Rate limiting | ❌ | Limiter OTP, login attempts |
| S8 | Audit log | ❌ | Logger actions sensibles (paiement, KYC) |

---

## PARTIE 9 — LOCALISATION MANQUANTE

| # | Élément | Statut | Action |
|---|---------|--------|--------|
| L1 | Fichiers ARB (FR/EN) | ❌ | Créer `lib/l10n/app_fr.arb` + `app_en.arb` |
| L2 | `flutter_localizations` | ❌ | Ajouter dépendance, configurer MaterialApp |
| L3 | Dates formatées FR | ❌ | `intl` avec locale fr_FR |
| L4 | Nombres formatés FR | ❌ | Espace millier, virgule décimale |
| L5 | RTL support | ❌ | Vérifier layout si langue arabe ajoutée V2 |

---

## PARTIE 10 — CI/CD & DEVOPS MANQUANTS

| # | Élément | Statut | Action |
|---|---------|--------|--------|
| D1 | GitHub Actions | ❌ | Build + test + analyze sur PR |
| D2 | Code coverage | ❌ | `flutter test --coverage`, badge README |
| D3 | Fastlane | ❌ | Automatisation build store |
| D4 | Firebase App Distribution | ❌ | Beta testing interne |
| D5 | Sentry/Crashlytics | ❌ | Monitoring production |
| D6 | Analytics dashboard | ❌ | Mixpanel/Amplitude ou Firebase Analytics |

---

## PARTIE 11 — RÈGLES FIREBASE MANQUANTES

### Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /products/{productId} {
      allow read: if true;
      allow create: if request.auth != null && request.resource.data.seller.id == request.auth.uid;
      allow update, delete: if request.auth != null && resource.data.seller.id == request.auth.uid;
    }
    match /orders/{orderId} {
      allow read: if request.auth != null && 
        (resource.data.buyer.id == request.auth.uid || resource.data.seller.id == request.auth.uid);
      allow create: if request.auth != null && request.resource.data.buyer.id == request.auth.uid;
      allow update: if request.auth != null && 
        (resource.data.seller.id == request.auth.uid || resource.data.buyer.id == request.auth.uid);
    }
    match /chats/{chatId} {
      allow read, write: if request.auth != null && 
        request.auth.uid in resource.data.participants;
    }
    match /notifications/{notifId} {
      allow read: if request.auth != null && resource.data.user_id == request.auth.uid;
      allow write: if false;
    }
  }
}
```

### Firebase Storage Rules

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /avatars/{userId}/{fileName} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == userId
        && request.resource.size < 2 * 1024 * 1024
        && request.resource.contentType.matches('image/.*');
    }
    match /products/{sellerId}/{productId}/{fileName} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == sellerId
        && request.resource.size < 5 * 1024 * 1024
        && request.resource.contentType.matches('image/.*');
    }
    match /kyc/{userId}/{fileName} {
      allow read: if request.auth != null && request.auth.uid == userId;
      allow write: if request.auth != null && request.auth.uid == userId
        && request.resource.size < 10 * 1024 * 1024;
    }
  }
}
```

---

## PARTIE 12 — ORDRE DE RÉALISATION FINAL

### Sprint 1 — Fondation solide (Semaine 1)
- [ ] Intégrer les 6 logos SVG dans assets/
- [ ] Finaliser SplashScreen avec logo animé
- [ ] Audit dark mode sur les 27 écrans existants
- [ ] Audit animations (remplacer bounce/elastic sauf badges)
- [ ] Implémenter AppHaptics sur tous les boutons principaux
- [ ] Créer PriceText widget (format FCFA)
- [ ] Créer OfflineBanner widget

### Sprint 2 — Checkout & Paiement (Semaine 2)
- [ ] CheckoutAddressScreen (GPS + quartier + point repère)
- [ ] CheckoutDeliveryScreen (Standard/Express/Retrait)
- [ ] CheckoutPaymentScreen (Orange/MTN/Airtel/Cash)
- [ ] CheckoutReviewScreen (récap complet)
- [ ] PaymentProcessingScreen (animation + polling)
- [ ] PaymentFailedScreen (retry + suggestion)
- [ ] Mock PaymentService (simuler opérateurs)

### Sprint 3 — Vendeur WhatsApp complet (Semaine 3)
- [ ] WhatsAppProductCreateScreen (photos + prix + voice)
- [ ] WhatsAppProductDetailScreen (lien + QR + toggle)
- [ ] WhatsAppOrdersScreen (commandes reçues)
- [ ] WhatsAppOrderDetailScreen (actions vendeur)
- [ ] WhatsAppStatsScreen (vues/clics/ventes)
- [ ] KycScreen (selfie + ID + upload)

### Sprint 4 — Vendeur Boutique complet (Semaine 4)
- [ ] BoutiqueCatalogScreen (liste + recherche + filtres)
- [ ] BoutiqueProductCreateScreen (multi-photos + variants + SKU)
- [ ] BoutiqueOrdersScreen (tabs par statut)
- [ ] BoutiqueOrderDetailScreen (timeline + actions)
- [ ] BoutiqueWalletScreen (solde + retrait)
- [ ] BoutiqueInventoryScreen (stock + alertes)

### Sprint 5 — Livreur & Tracking (Semaine 5)
- [ ] NewDeliveryRequestScreen (bottom sheet 15s)
- [ ] DeliveryNavigationScreen (map itinéraire)
- [ ] DeliveryPickupScreen (QR vendeur + photo)
- [ ] DeliveryDropoffScreen (QR client + signature)
- [ ] DriverWalletScreen (solde + retrait)
- [ ] OrderTrackingScreen (map temps réel client)

### Sprint 6 — Chat & Notifications (Semaine 6)
- [ ] ChatOfferBubble (Accept/Refuse/Counter)
- [ ] SupportChatScreen (tickets support)
- [ ] PushNotificationHandler (FCM service)
- [ ] InAppNotificationBanner (slide from top)
- [ ] NotificationSettingsScreen (granulaire)

### Sprint 7 — Profil & Polish (Semaine 7)
- [ ] AddressesScreen + AddAddressScreen
- [ ] PaymentMethodsScreen
- [ ] SecurityScreen + PrivacyScreen
- [ ] Empty states personnalisés (5 variants)
- [ ] Error states avec retry intelligent
- [ ] Pull-to-refresh + infinite scroll partout

### Sprint 8 — Tests & Performance (Semaine 8)
- [ ] Tests unitaires (formatters, validators, auth)
- [ ] Tests intégration (flow achat complet)
- [ ] Tests UI golden (splash, auth, dark mode)
- [ ] Performance audit (cold start, scroll 60fps)
- [ ] APK size optimization (< 30MB)
- [ ] Accessibilité audit (TalkBack, contrastes)

### Sprint 9 — Backend & Sécurité (Semaine 9)
- [ ] Firestore collections complètes
- [ ] Security Rules (Firestore + Storage)
- [ ] Cloud Functions (paiement, escrow, notifications)
- [ ] Firebase Auth Phone OTP production
- [ ] FCM configuration
- [ ] flutter_secure_storage

### Sprint 10 — Lancement (Semaine 10)
- [ ] CI/CD GitHub Actions
- [ ] Fastlane configuration
- [ ] Firebase App Distribution (beta)
- [ ] Store listings (Play Store + App Store)
- [ ] Documentation utilisateur
- [ ] Monitoring Sentry/Crashlytics

---

## PARTIE 13 — CHECKLIST FINALE AVANT LANCEMENT

### Fonctionnel
- [ ] Client peut rechercher, ajouter au panier, payer, suivre
- [ ] Vendeur WhatsApp peut créer produit, partager lien, gérer commandes
- [ ] Vendeur Boutique peut gérer catalogue, stock, commandes, retraits
- [ ] Livreur peut accepter courses, naviguer, scanner QR, livrer
- [ ] Chat fonctionne (texte, photo, voice, offre prix)
- [ ] Notifications push fonctionnent (commande, livraison, message)

### Design
- [ ] Tous les écrans en dark mode
- [ ] Animations cohérentes (250ms, easeOut)
- [ ] Haptic sur toutes les actions principales
- [ ] Empty states personnalisés
- [ ] Skeleton loading partout
- [ ] Logo OKIBA intégré (splash, appBar, empty states)

### Performance
- [ ] Cold start < 3s
- [ ] Scroll 60fps
- [ ] Images < 500ms
- [ ] APK < 30MB
- [ ] Mode bas débit fonctionnel
- [ ] Offline mode fonctionnel

### Sécurité
- [ ] Auth sécurisée (OTP + JWT)
- [ ] Paiement sécurisé (escrow)
- [ ] Données chiffrées (secure storage)
- [ ] Rules Firestore restrictives
- [ ] Pas de données sensibles en clair

### Qualité
- [ ] 0 erreurs `flutter analyze`
- [ ] Tests > 70% coverage
- [ ] 0 crash sur 100 sessions beta
- [ ] NPS beta > 50

---

> **Document vivant** — Mettre à jour après chaque sprint  
> **Dernière mise à jour :** 2026-05-20
