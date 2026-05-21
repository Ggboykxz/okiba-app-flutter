# Okiba — Le Marché Gabonais

Super-app e-commerce multi-rôles pour le Gabon (Flutter, Material 3, Clean Architecture).

**Client** · **Vendeur** (WhatsApp / Boutique / Rapide) · **Livreur** · **Admin**

---

## Statistiques

| Métrique | Valeur |
|----------|--------|
| Fichiers Dart | ~158 |
| Lignes de code | ~23 200 |
| Écrans | 101 |
| Routes GoRouter | 99 |
| Phases complètes | 14/14 |
| `flutter analyze` | ✅ 0 erreurs, 0 warnings |
| `flutter test` | ✅ All passed |

---

## Fonctionnalités

- **13 phases** couvrant tout le parcours : auth, onboarding, achat, vente, livraison, chat, profil, admin
- **Paiements** : Orange Money, MTN MoMo, Airtel Money, carte, espèces (UI complète, logique API à connecter)
- **Bilingue FR/EN** : 430+ clés ARB, `AppLocalizations` partout, pas de chaînes hardcodées
- **Offline-first** : Hive pour cache local, détection connectivité
- **Design System** Material 3 : palette Forêt Gabonaise `#1B5E3F`, touch targets 56dp, Inter typography
- **Assets intégrés** : Logo SVG (6 variants), 80+ icônes SVG catégorisées, 8 animations Lottie, 21 illustrations PNG

---

## Prérequis

- Flutter 3.35+
- Dart SDK 3.9+

## Commandes

```bash
flutter analyze          # Vérification statique
flutter test             # Tests
flutter gen-l10n         # Régénérer traductions ARB
flutter run -d <device>  # Lancement
```

## Architecture

```
lib/
├── core/          # Constantes, thème, GoRouter, widgets, services
├── data/          # Modèles, datasources (Hive/Firestore), repositories
├── domain/        # Entités, use cases
├── presentation/  # Screens par feature area
└── l10n/          # ARB FR/EN + generated AppLocalizations
```

## Prochaines étapes

- [ ] Configurer Firebase (google-services.json, Firestore, Auth, Storage)
- [ ] Connecter paiement mobile money (Orange Money, MTN MoMo, Airtel Money)
- [ ] Push notifications FCM
- [ ] Remplacer assets placeholders par fichiers réels
- [ ] CI/CD (GitHub Actions)

## Licence

Propriétaire — Okiba
