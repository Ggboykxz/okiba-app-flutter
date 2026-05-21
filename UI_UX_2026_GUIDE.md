# UI/UX_2026_GUIDE.md — Design Supérieur pour Okiba

> **App :** Okiba — Le Marché Gabonais  
> **Standard :** UI/UX 2026 — Niveau Apple / Airbnb / Notion / Linear  
> **Date :** 2026-05-21  
> **Version :** 2.0.0

---

## 1. Philosophie 2026 : "Calme, Confiance, Cinéma"

### Les 5 principes du design 2026

| Principe | Description | Exemple concret dans Okiba |
|----------|-------------|---------------------------|
| **1. Calme avant action** | L'écran respire. 60% vide, 40% contenu. Pas de surcharge. | HomeScreen avec espacement généreux entre sections |
| **2. Cinéma du quotidien** | Chaque transition raconte une histoire. Pas juste A→B, mais A→découverte→B. | Checkout : adresse→livraison→paiement avec reveal progressif |
| **3. Confiance par transparence** | L'utilisateur voit toujours ce qui se passe. Pas de magie noire. | Paiement : étapes visibles, timer, confirmation haptique |
| **4. Contexte intelligent** | L'UI s'adapte au moment, pas juste au device. | Mode bas débit auto, nuit auto, panier urgent |
| **5. Humanité numérique** | L'app a une personnalité. Pas un robot. | Messages chaleureux, animations organiques, voix locale |

---

## 2. Design Tokens 2026 — Évolution depuis 1.0

### 2.1 Palette étendue — "Gabon Premium"

#### Couleurs primaires (inchangées — identité forte)
| Token | Hex | Usage 2026 |
|-------|-----|-----------|
| `primary` | `#1B5E3F` | Actions principales, boutons filled, indicateurs |
| `onPrimary` | `#FFFFFF` | Texte sur primary |
| `primaryContainer` | `#D1F2E1` | Chips sélectionnés, badges "En ligne" |
| `onPrimaryContainer` | `#0D3B26` | Texte sur primaryContainer |

#### Couleurs secondaires (inchangées)
| Token | Hex | Usage 2026 |
|-------|-----|-----------|
| `secondary` | `#E8913A` | Promotions, prix barrés, accents chaleureux |
| `onSecondary` | `#FFFFFF` | Texte sur secondary |
| `secondaryContainer` | `#FFF3E0` | Banners promo, fonds chauds |
| `onSecondaryContainer` | `#6D3B0F` | Texte sur secondaryContainer |

#### NOUVEAU : Surface Glass (2026)
| Token | Hex | Usage 2026 |
|-------|-----|-----------|
| `surfaceGlass` | `rgba(255,255,255,0.72)` | Cards flottantes, bottom sheets, dialogs |
| `surfaceGlassDark` | `rgba(28,25,23,0.64)` | Cards flottantes dark mode |
| `surfaceGlassBorder` | `rgba(255,255,255,0.24)` | Bordure glass light |
| `surfaceGlassBorderDark` | `rgba(255,255,255,0.08)` | Bordure glass dark |
| `backdropBlur` | `backdrop-filter: blur(24px)` | Effet glassmorphism |

#### NOUVEAU : Accent Glow (2026)
| Token | Hex | Usage 2026 |
|-------|-----|-----------|
| `accentGlow` | `rgba(27,94,63,0.16)` | Ombre portée douce primary |
| `accentGlowSecondary` | `rgba(232,145,58,0.20)` | Ombre portée douce secondary |
| `accentGlowTertiary` | `rgba(141,110,99,0.16)` | Ombre portée douce tertiary |

#### NOUVEAU : États émotionnels (2026)
| Token | Hex | Usage 2026 |
|-------|-----|-----------|
| `emotionSuccess` | `#10B981` | Succès + glow vert subtil |
| `emotionWarning` | `#F59E0B` | Attention + pulse orange |
| `emotionError` | `#EF4444` | Erreur + shake + glow rouge |
| `emotionInfo` | `#3B82F6` | Info + ripple bleu |
| `emotionCelebration` | `#FBBF24` | Célébration (paiement, livraison) |

### 2.2 Typographie 2026 — "Lecture sans friction"

Police : **Inter** (conservé) + **Space Grotesk** (nouveau — titres display uniquement)

| Token | Taille | Poids | Hauteur | Lettre | Usage 2026 |
|-------|--------|-------|---------|--------|-----------|
| `displayHero` | 64px | 700 | 72px | -1.5px | Splash screen, onboarding hero |
| `displayLarge` | 48px | 700 | 56px | -0.5px | Titres majeurs d'écran |
| `displayMedium` | 40px | 700 | 48px | 0px | Sections importantes |
| `headlineLarge` | 32px | 700 | 40px | 0px | Titres d'écran standard |
| `headlineMedium` | 28px | 700 | 36px | 0px | Titres de section |
| `titleLarge` | 22px | 700 | 30px | 0px | AppBar titles, cards headers |
| `titleMedium` | 18px | 600 | 26px | 0.15px | Sous-titres, list items |
| `titleSmall` | 15px | 600 | 22px | 0.1px | Labels, overlines |
| `bodyLarge` | 17px | 400 | 26px | 0.5px | Paragraphes principaux |
| `bodyMedium` | 15px | 400 | 22px | 0.25px | Texte standard |
| `bodySmall` | 13px | 400 | 18px | 0.4px | Metadata, timestamps |
| `labelLarge` | 15px | 700 | 22px | 0.1px | Boutons, chips |
| `labelMedium` | 13px | 700 | 18px | 0.5px | Badges, tags |
| `labelSmall` | 11px | 700 | 16px | 0.5px | Micro-labels |
| `priceDisplay` | 32px | 800 | 40px | -0.5px | Prix principal produit |
| `priceLarge` | 24px | 800 | 32px | 0px | Prix panier, checkout |
| `priceMedium` | 20px | 700 | 28px | 0px | Prix sous-total |
| `priceSmall` | 15px | 600 | 22px | 0px | Prix barré, frais |

> **NOUVEAU 2026 :** `font-variation-settings` pour Inter (variable font) — poids fluide 400→800 sans changement de fichier.

### 2.3 Espacements 2026 — "Grille musicale"

| Token | Valeur | Usage 2026 | Note |
|-------|--------|-----------|------|
| `space2` | 2px | Micro-ajustements | Nouveau |
| `space4` | 4px | Gap tight | |
| `space8` | 8px | Padding chips | |
| `space12` | 12px | Padding boutons small | |
| `space16` | 16px | Padding standard | |
| `space20` | 20px | Padding confortable | |
| `space24` | 24px | Section padding | |
| `space32` | 32px | Section breaks | |
| `space40` | 40px | Grandes séparations | |
| `space48` | 48px | Hero spacing | |
| `space64` | 64px | Spacing majeur | |
| `space80` | 80px | Section majeure | Nouveau |
| `space96` | 96px | Break majeur | Nouveau |

> **Règle 2026 :** Les multiples de 8 sont la "mesure", les multiples de 4 sont la "demi-mesure", les multiples de 2 sont le "quart de mesure". Jamais de valeur impaire.

### 2.4 Rayons 2026 — "Morphologie organique"

| Token | Valeur | Usage 2026 | Note |
|-------|--------|-----------|------|
| `radius4` | 4px | Micro-elements, tags | Nouveau |
| `radius8` | 8px | Buttons, inputs | |
| `radius12` | 12px | Cards medium | |
| `radius16` | 16px | Cards large, bottom sheets | |
| `radius20` | 20px | Feature cards | |
| `radius24` | 24px | Modals, dialogs | Nouveau |
| `radius28` | 28px | Hero cards | Nouveau |
| `radiusFull` | 999px | Avatars, FABs, pills | |
| `radiusApple` | 44px | App icon style (iOS) | Nouveau |

### 2.5 Ombres 2026 — "Lumière gabonaise"

| Niveau | Light Mode | Dark Mode | Usage |
|--------|-----------|-----------|-------|
| `elevation0` | Aucune | Surface pure | Flat |
| `elevation1` | `0 1px 2px rgba(27,94,63,0.06)` | `0 1px 2px rgba(0,0,0,0.3)` | Subtile |
| `elevation2` | `0 4px 12px rgba(27,94,63,0.08)` | `0 4px 12px rgba(0,0,0,0.35)` | Cards |
| `elevation3` | `0 8px 24px rgba(27,94,63,0.10)` | `0 8px 24px rgba(0,0,0,0.4)` | Modals |
| `elevation4` | `0 16px 48px rgba(27,94,63,0.12)` | `0 16px 48px rgba(0,0,0,0.45)` | Hero |
| `elevationGlow` | `0 0 24px rgba(27,94,63,0.16)` | `0 0 24px rgba(52,211,153,0.12)` | Accent glow |

---

## 3. Composants UI 2026 — "Molécules vivantes"

### 3.1 Boutons — "Touchables avec âme"

#### Primary Button 2026 (Filled + Glow)
```
- Hauteur : 56px (standard) / 48px (compact)
- Padding horizontal : space24
- Radius : radius16 (nouveau — plus organique)
- Background : primary
- Text : onPrimary, labelLarge
- Élévation : elevation2 + elevationGlow (subtle glow)
- Pressed : scale 0.96 + darken 12% + glow intensifié
- Hover (desktop/web) : scale 1.02 + glow intensifié
- Disabled : surfaceVariant + onSurfaceVariant à 38% + pas de glow
- Haptic : lightImpact on press + selectionClick on release
- Animation : 200ms, easeOutQuart (nouveau — plus doux)
```

#### Secondary Button 2026 (Glass)
```
- Hauteur : 56px
- Background : surfaceGlass + backdropBlur
- Border : 1px surfaceGlassBorder
- Text : primary, labelLarge
- Pressed : primaryContainer fill + scale 0.96
- Hover : scale 1.02 + border primary
```

#### FAB 2026 (Floating + Pulse)
```
- Taille : 64x64dp
- Shape : radiusFull
- Background : primary
- Icon : onPrimary, 28px
- Élévation : elevation3 + elevationGlow
- Haptic : mediumImpact on press
- Idle : pulse subtle (scale 1.0→1.02→1.0, 3s, infinite)
- Pressed : scale 0.90 + ripple circulaire
```

#### WhatsApp Button 2026 (Organic)
```
- Hauteur : 48px
- Background : #25D366 avec gradient subtil
- Icon : WhatsApp 24px + "Contacter"
- Radius : radiusFull
- Élévation : elevation2
- Pressed : scale 0.96 + glow vert WhatsApp
- Haptic : lightImpact
```

### 3.2 Cards 2026 — "Surfaces flottantes"

#### Product Card 2026 (Glass + Hover)
```
- Padding : 0 (image edge-to-edge) + space16 (contenu)
- Radius : radius20 (plus doux)
- Background : surfaceGlass + backdropBlur (light) / surfaceGlassDark (dark)
- Border : 1px surfaceGlassBorder
- Image : ratio 3:4 (portrait — meilleur pour mode), radius top radius20
- Prix : priceDisplay, onSurface, bottom-left overlay avec gradient noir subtil
- Badge état : top-right, radiusFull, primaryContainer + blur
- Vendeur : avatar 32px + nom + badge vérifié (mini)
- Pressed : scale 0.98 + glow primary + haptic
- Hover (desktop) : scale 1.02 + elevation4 + glow
- Animation apparition : fade 0→1 + slideY(30→0) + scale(0.95→1.0), 400ms, easeOutQuart
```

#### Commande Card 2026 (Timeline intégrée)
```
- Padding : space20
- Radius : radius16
- Background : surface
- Élévation : elevation1
- Header : ID commande + statut badge animé
- Timeline : 4-5 dots connectés par ligne, dot actif pulse
- Body : photo miniature + nom produit + prix
- Footer : actions contextuelles (suivre, contacter, noter)
- Swipe : swipe right → "Suivre", swipe left → "Contacter"
```

#### Feature Card 2026 (Hero)
```
- Padding : space24
- Radius : radius24
- Background : gradient primary→primaryContainer (subtil)
- Élévation : elevation3 + elevationGlow
- Border : 1px primary à 20% opacity
- Animation : shimmer subtil sur gradient (idle)
```

### 3.3 Inputs 2026 — "Champs de conscience"

```
- Hauteur : 56px
- Padding : space16 horizontal, space16 vertical
- Radius : radius12
- Background : surfaceVariant
- Border : 2px outline (unfocused) / 3px primary (focused) / 3px error (erreur)
- Label : titleSmall, onSurfaceVariant → primary (focused) → error (erreur)
- Floating label : animation 200ms, scale 0.85, translateY -8px
- Text : bodyLarge, onSurface
- Cursor : primary, width 2px, blink 530ms
- Placeholder : onSurfaceVariant à 50%, animation fade in/out
- Voice icon : mic 24px à droite, pulse quand recording
- Error : error color + helper text bodyMedium + icon error 16px
- Success : success color + check icon 16px (auto après validation)
- Disabled : onSurface à 38% + background surfaceVariant à 60%
- Haptic : lightImpact on focus + selectionClick on valid
```

#### NOUVEAU : Input OTP 2026
```
- 6 champs individuels, 48x56dp chacun
- Radius : radius12
- Background : surfaceVariant
- Focused : border 3px primary + glow primary
- Filled : background primaryContainer + text primary
- Auto-focus : next champ quand rempli
- Paste : support paste complet depuis SMS
- Haptic : selectionClick par chiffre + mediumImpact quand complet
- Animation : scale 1.0→1.05→1.0 quand rempli
```

### 3.4 Chips & Badges 2026 — "États vivants"

#### Filter Chip 2026
```
- Hauteur : 40px
- Padding : space16 horizontal
- Radius : radiusFull
- Unselected : surfaceGlass + onSurfaceVariant
- Selected : primaryContainer + onPrimaryContainer + check icon 18px
- Animation : background color 200ms + scale 1.0→1.05→1.0 + haptic
- Pressed : scale 0.95
```

#### Statut Badge 2026 (Pulse)
```
- Hauteur : 32px
- Padding : space12 horizontal
- Radius : radiusFull
- Couleurs selon état :
  - En attente : warningContainer + warning + pulse lent (2s)
  - Confirmé : primaryContainer + primary + pulse subtil (3s)
  - En route : infoContainer + info + pulse rapide (1s)
  - Livré : successContainer + success + glow permanent
  - Annulé : errorContainer + error + shake une fois
- Text : labelMedium BOLD
- Animation : pulse scale 1.0→1.05→1.0 selon vitesse état
```

### 3.5 AppBar 2026 — "Disparition élégante"

```
- Hauteur : 64px (avec status bar)
- Background : transparent (top) → surfaceGlass + backdropBlur (scrollé > 20px)
- Transition : 300ms, easeOutQuart, pas de flash
- Title : titleLarge BOLD, onSurface
- Leading : 56dp touch target, back icon 24px + haptic
- Actions : 56dp touch targets, spaced space4
- Search : intégrée, radiusFull, glass background, mic icon
- Bottom : TabBar ou Divider 1px outlineVariant
- Scroll behavior : hide on scroll down, reveal on scroll up (200ms)
```

### 3.6 Bottom Navigation 2026 — "Dock flottant"

```
- Position : floating, 16px from bottom, 16px from sides
- Width : auto (contenu + padding)
- Hauteur : 72px
- Background : surfaceGlass + backdropBlur + border 1px surfaceGlassBorder
- Radius : radius24
- Élévation : elevation3
- Items : 4-5 max
- Icon : 24px, onSurfaceVariant (inactive) / primary (active)
- Active : icon filled + scale 1.1 + glow primary subtil
- Label : labelSmall, visible uniquement si active
- Animation : scale + translateY, 300ms, easeOutQuart
- Haptic : lightImpact on tab change + selectionClick
- FAB center : "Vendre" button, primary, 56dp, pulse idle
```

### 3.7 Bottom Sheet 2026 — "Revelation"

```
- Enter : slide from bottom, 400ms, easeOutQuart
- Background : fade to black 40%, 300ms
- Content : surfaceGlass + backdropBlur + radius top radius24
- Handle : barre 36x4px, surfaceVariant, radiusFull, centered, 8px top
- Drag : follow finger, snap to 50%/85%/100%, dismiss < 25%
- Haptic : lightImpact on snap open + heavyImpact on dismiss
- Scroll : content scrollable si hauteur > 85%
```

---

## 4. Animations 2026 — "Cinéma du quotidien"

### 4.1 Courbes 2026 — "Mouvement naturel"

| Nom | Flutter | Usage | Description |
|-----|---------|-------|-------------|
| `easeOutQuart` | `Curves.easeOut` modifié | Par défaut | Décélération douce, naturelle |
| `easeOutExpo` | Custom | Page transitions | Décélération très douce, premium |
| `easeSpring` | `Curves.elasticOut` modifié | Success, badges | Rebond subtil, pas exagéré |
| `easeBounce` | `Curves.bounceOut` modifié | Celebration | Rebond joyeux, limité 2 cycles |
| `easeSmooth` | Custom | Scroll | Accélération/décélération symétrique |
| `easeSnap` | Custom | Lists | Snap rapide, fluide |

### 4.2 Durées 2026 — "Rythme respiratoire"

| Type | Durée | Usage | Note |
|------|-------|-------|------|
| `micro` | 100ms | Hover states, focus | Instantané, perceptible |
| `fast` | 150ms | Buttons press, chips | Rapide, confirme l'action |
| `normal` | 250ms | Cards, transitions | Standard, fluide |
| `slow` | 350ms | Page transitions, modals | Cinématique, storytelling |
| `cinematic` | 500ms | Onboarding, hero | Théâtral, mémorable |
| `ambient` | 3000ms | Idle animations | Pulse, breathe, shimmer |

### 4.3 Patterns d'animation 2026

#### Page Transition — "Shared Journey"
```
- Forward : 
  1. Écran actuel : scale 1.0→0.95 + fade 1.0→0.8 (150ms)
  2. Écran nouveau : slide from right 30% + fade 0.0→1.0 (350ms, easeOutExpo)
  3. Éléments partagés : Hero avec scale + fade + position
- Back :
  1. Écran actuel : slide to right 20% + fade 1.0→0.0 (250ms)
  2. Écran précédent : scale 0.95→1.0 + fade 0.8→1.0 (250ms)
- Courbe : easeOutExpo
- Durée totale : 400ms
```

#### List Stagger — "Cascade"
```
- Chaque item : fade 0→1 + slideY(40→0) + scale(0.92→1.0)
- Delay : index * 80ms (max 8 items, après instant)
- Durée : 400ms, easeOutQuart
- Trigger : on screen appear, pull-to-refresh, filter change
- Variante "waterfall" : slideY + rotationZ(-2→0) pour effet cascade
```

#### Skeleton 2026 — "Respiration"
```
- Shimmer : gradient subtil, pas blanc pur
  - Light : surfaceVariant → surface → surfaceVariant
  - Dark : surfaceVariant → surface à 120% → surfaceVariant
- Animation : translateX(-100%→100%), 2s, easeSmooth, infinite
- Card skeleton : même shape exacte, radius identique
- Text skeleton : rounded rectangles, heights matching typography
- NOUVEAU : Skeleton pulse (opacity 0.6→1.0→0.6, 2s) quand attente > 3s
```

#### Pull to Refresh 2026 — "Elasticité"
```
- Trigger : overscroll 80px
- Indicator : logo Okiba qui rotate + scale (0.8→1.0→1.2→1.0)
- Haptic : mediumImpact on trigger
- Content : fade out old → skeleton → fade in new
- Release : elastic snap back, 300ms, easeSpring
```

#### Success Celebration — "Joie"
```
- Étape 1 (0-200ms) : Background flash successContainer
- Étape 2 (100-400ms) : Checkmark draw (SVG path animation)
- Étape 3 (200-600ms) : Confetti particles (12-20 particules, couleurs brand)
- Étape 4 (300-800ms) : Scale 0.8→1.1→1.0 + glow success
- Étape 5 (400-1000ms) : Text "Succès !" fade + slideY(20→0)
- Haptic : mediumImpact + selectionClick + lightImpact (pattern 3 coups)
- Son : Subtle chime (optionnel, respecte silent mode)
```

#### Error Feedback — "Empathie"
```
- Étape 1 (0-100ms) : Shake X (-8, 8, -4, 4, 0), 400ms
- Étape 2 (50-200ms) : Background flash errorContainer
- Étape 3 (100-300ms) : Icon error pulse + glow rouge subtil
- Étape 4 (200-500ms) : Message erreur slide from top + fade
- Haptic : heavyImpact (1 coup fort)
- Son : Subtle buzz (optionnel)
- Recovery : Bouton retry avec pulse subtil après 2s
```

#### Livreur Course — "Urgence"
```
- Notification : bottom sheet slide from bottom + glow orange pulse
- Timer : countdown 15s, cercle SVG qui se rétrécit, color primary→warning→error
- Pulse : scale 1.0→1.03→1.0, 1s, infinite
- Haptic : pulse toutes les 2s (lightImpact + selectionClick)
- Accept : scale 1.0→0.9 + glow vert + confetti mini (5 particules)
- Decline : slide out left + fade + haptic heavyImpact
```

---

## 5. Layout 2026 — "Grille dorée mobile"

### 5.1 Breakpoints 2026

| Nom | Width | Usage | Adaptation |
|-----|-------|-------|------------|
| `compact` | < 360px | Très petit écran | Texte 90%, touch targets 48dp min |
| `small` | 360-400px | Mobile standard | Design par défaut |
| `medium` | 400-600px | Mobile large / tablet petit | Grille 3 colonnes catégories |
| `expanded` | 600-840px | Tablet | Grille 3 colonnes produits, sidebar nav |
| `large` | > 840px | Desktop / foldable | Grille 4 colonnes, master-detail |

### 5.2 Grilles 2026

#### Feed Principal (Home)
```
- Layout : Masonry (hauteur variable) ou grille 2 colonnes
- Gap : space12 horizontal, space16 vertical
- Margins : space16
- Cards : ratio 3:4 portrait (meilleur pour photos produit)
- Section headers : sticky, glass background + blur
- Pull-to-refresh : elastic avec logo animation
```

#### Grille Catégories (Icon-first)
```
- 4 colonnes (compact: 3, medium: 5, expanded: 6)
- Icon : 36px (compact: 28px)
- Label : labelSmall, 1 ligne
- Gap : space16
- Touch target : 72x72dp minimum
- Pressed : scale 0.92 + background primaryContainer + haptic
```

#### Grille Produits (Search/Category)
```
- 2 colonnes (compact: 2, medium: 3, expanded: 4)
- Ratio : 3:4 portrait
- Gap : space12
- Margins : space16
- Animation stagger : cascade 80ms
```

---

## 6. Patterns UX 2026 — "Intelligence émotionnelle"

### 6.1 Paiement Mobile Money — "Rituel de confiance"

```
Écran :
├── Header : Logo opérateur (Orange/MTN/Airtel) 48px + nom
├── Montant : priceDisplay, onSurface, centré
├── Instructions animées :
│   ├── Étape 1 : "Vous allez recevoir un SMS" + icon SMS + timer 30s
│   ├── Étape 2 : "Entrez votre code PIN" + icon lock
│   └── Étape 3 : "Validez sur votre téléphone" + icon check
├── Numéro : input pré-rempli +241, clavier numérique
├── Bouton : "J'ai validé sur mon téléphone" (primary, pulse si timer < 10s)
├── Timer : cercle SVG qui se rétrécit, 2min max
├── Polling : dots animés "En attente de confirmation..."
└── Fallback : "Je n'ai pas reçu le SMS" → retry / autre opérateur

Succès :
├── Animation célébration (confetti + chime)
├── "Paiement confirmé !" + numéro transaction
├── Récapitulatif commande
└── CTA : "Voir ma commande" / "Continuer mes achats"

Échec :
├── Animation empathie (shake + buzz)
├── Raison : "Fonds insuffisants" / "Timeout" / "Annulé"
├── Suggestion : "Réessayer" / "Autre opérateur" / "Cash à la livraison"
└── Support : "Besoin d'aide ?" → chat support
```

### 6.2 Chat & Négociation — "Conversation chaleureuse"

```
Bulle message :
├── Sender (moi) : align right, background primaryContainer, radius16 top-left
├── Receiver : align left, background surfaceVariant, radius16 top-right
├── Offre prix : card spéciale
│   ├── Produit miniature 48px
│   ├── "Prix proposé" + priceLarge secondary
│   ├── "Prix original" barré
│   └── Actions : "Accepter" (primary) / "Refuser" (outlined) / "Contre-proposer" (text)
├── Voice note : waveform animée + durée + play/pause
│   └── Waveform : bars 24px, animées quand lecture
├── Quick replies : chips scrollable horizontalement
│   └── "Oui" / "Non" / "Je vérifie" / "Disponible" / "Prix fixe"
├── Typing indicator : 3 dots animés (scale pulse, 1.2s)
└── Status : envoyé → reçu → lu (checkmarks animés)

Input :
├── Texte : input glass + mic icon
├── Mic pressé : recording mode
│   ├── Waveform live + timer
│   ├── Swipe left to cancel (red)
│   └── Release to send + haptic
└── Attach : photo / camera / location
```

### 6.3 Suivi Commande — "Théâtre de la livraison"

```
Timeline :
├── Verticale, centrée, 4-5 étapes
├── Dot actif : scale 1.3 + pulse + glow primary
├── Dot complété : scale 1.0 + check icon + primary
├── Dot futur : scale 1.0 + outline + onSurfaceVariant
├── Ligne entre dots : animée (draw from top, 400ms)
└── Étiquette : bodyMedium, slide in from left

Map (si livreur assigné) :
├── Mini-map 200px, radius16
├── Pin livreur : avatar 32px + pulse ring
├── Pin client : maison icon + primary
├── Route : ligne animée (dash pattern qui se remplit)
└── ETA : "Arrivée estimée : 14h30" + countdown

Notification livreur proche :
├── In-app banner slide from top
├── "Votre livreur est à 500m !"
├── Avatar livreur + nom + note
└── Actions : "Appeler" / "Message" / "Voir sur la carte"
```

### 6.4 États Vides 2026 — "Compagnons silencieux"

```
Illustration : animation Lottie (pas statique)
├── 120px, loop subtile (respiration)
├── Couleur : onSurfaceVariant à 40%
└── Style : flat, personnage africain inclusif

Titre : headlineSmall, onSurface, centered
Sous-titre : bodyLarge, onSurfaceVariant, centered, max 2 lignes
CTA : Primary button, centered, space24 below
Animation : fade + slideY(40→0) + scale(0.9→1.0), 500ms, easeOutQuart
```

### 6.5 Feedback Haptique 2026 — "Langage tactile"

| Action | Haptic | Intensité | Pattern |
|--------|--------|-----------|---------|
| Button press | `lightImpact()` | Léger | 1 coup |
| Button release | `selectionClick()` | Très léger | 1 clic |
| Toggle/Switch | `lightImpact()` | Léger | 1 coup |
| Tab change | `lightImpact()` | Léger | 1 coup |
| Ajout panier | `mediumImpact()` | Moyen | 1 coup + 1 clic |
| Swipe delete | `heavyImpact()` | Fort | 1 coup fort |
| Paiement succès | `mediumImpact()` + `selectionClick()` + `lightImpact()` | Pattern | 3 coups rapides |
| Paiement échec | `heavyImpact()` | Fort | 1 coup fort + vibration |
| Nouvelle course | `heavyImpact()` toutes les 2s | Urgent | Pulse répété |
| Course acceptée | `mediumImpact()` + `selectionClick()` | Confirmant | 2 coups |
| Livraison finalisée | `mediumImpact()` + `selectionClick()` + `lightImpact()` | Célébration | 3 coups joyeux |
| Scroll snap | `selectionClick()` | Très léger | 1 clic |
| Refresh triggered | `mediumImpact()` | Moyen | 1 coup |
| Error shake | `heavyImpact()` | Fort | 1 coup + vibration continue 200ms |
| Success confetti | `mediumImpact()` + `selectionClick()` | Célébration | 2 coups |

---

## 7. Accessibilité 2026 — "Design pour tous, par tous"

### 7.1 Standards

| Critère | Valeur | Test |
|---------|--------|------|
| Touch targets | ≥ 56x56dp | Règle physique sur écran |
| Texte minimum | 13sp (metadata), 15sp (standard), 17sp (actions) | Paramètres accessibilité |
| Contraste | WCAG AAA (7:1) pour texte, AA (4.5:1) pour UI | Outil de test |
| Focus visible | Ring 3px primary + glow, pas de outline par défaut | Navigation clavier |
| Réduire motion | Respecte `MediaQuery.disableAnimations` | Paramètres système |
| VoiceOver/TalkBack | Labels sémantiques sur tout | Test aveugle |
| Font size 200% | Layout adaptatif, pas de troncature | Paramètres système |
| Colorblind | Pas d'info par couleur seule + patterns/textures | Simulateur |

### 7.2 Features accessibilité 2026

```
- Voice input : micro sur TOUS les inputs texte
- VoiceOver descriptions : "Bouton, Acheter maintenant, 5000 FCFA"
- Haptic navigation : vibration différente par type d'élément
- High contrast mode : contrastes renforcés, pas de glassmorphism
- Large text mode : layout adaptatif, pas de troncature
- Screen reader optimization : ordre de lecture logique
- Motor accessibility : touch targets 72dp, gestures simplifiés
```

---

## 8. Dark Mode 2026 — "Nuit tropicale premium"

### 8.1 Principes

```
- Surface plus clair que background (inversé par rapport au light)
- Élévation = +1 niveau de clarté (surfaceVariant > surface > background)
- Ombres deviennent "lumières" subtiles (elevation overlays)
- Images : pas de filtre, mais éviter fonds blancs dans assets
- Primary plus lumineux : #34D399 (vs #1B5E3F en light)
- Secondary doré : #FBBF24 (vs #E8913A en light)
- Glassmorphism : plus prononcé en dark (contraste naturel)
```

### 8.2 Spécificités dark

| Élément | Light | Dark | Note |
|---------|-------|------|------|
| Background | `#FAFAF7` | `#0C0A09` | Noir chaud, pas pur |
| Surface | `#FFFFFF` | `#1C1917` | Card background |
| SurfaceVariant | `#F5F5F0` | `#292524` | Input background |
| Primary | `#1B5E3F` | `#34D399` | Plus lumineux |
| Secondary | `#E8913A` | `#FBBF24` | Plus doré |
| Glass | `rgba(255,255,255,0.72)` | `rgba(28,25,23,0.64)` | Adapté |
| Glow | `rgba(27,94,63,0.16)` | `rgba(52,211,153,0.12)` | Plus subtil |
| Texte principal | `#1C1917` | `#FAFAF7` | Inversé |
| Texte secondaire | `#78716C` | `#A8A29E` | Plus clair |

---

## 9. Assets 2026 — "Qualité cinématographique"

### 9.1 Images

```
Format : WebP (compression 30-50% meilleure que PNG/JPEG)
Résolution : 2x pour retina, 3x pour super retina
Placeholder : blur hash (20x20px) pendant chargement
Lazy loading : intersection observer, 200px avant viewport
Cache : 7 jours, max 100MB
Compression upload : 80% qualité, max 2MB avatar, 5MB produit
```

### 9.2 Animations Lottie

```
Format : JSON Lottie, 60fps
Taille : < 50KB par animation
Optimisation : pas de shapes complexes, précomposer
Fallback : AnimatedSwitcher vers placeholder statique si > 3s chargement
```

### 9.3 Icônes

```
Format : SVG, 24x24px viewBox
Stroke : 1.5px regular, 2px bold
Style : Phosphor Icons (regular + bold + fill)
Animation : scale + color transition 150ms
```

---

## 10. Performance 2026 — "60fps ou rien"

### 10.1 Objectifs

| Métrique | Cible | Test |
|----------|-------|------|
| Cold start | < 2s | `flutter run --profile` |
| First frame | < 16ms | DevTools timeline |
| Scroll | 60fps constant | DevTools performance |
| Image load | < 300ms première image | Network tab |
| Animation | 60fps, jank < 2% | DevTools timeline |
| APK size | < 25MB | `flutter build apk --analyze-size` |
| Memory | < 120MB en usage | DevTools memory |
| Battery | Pas de drain anormal | Profiling device |

### 10.2 Techniques

```
- RepaintBoundary sur cards complexes
- const constructors partout
- ListView.builder (pas ListView) pour longues listes
- ImageCache limite : 100 images, 50MB
- Debounce search : 300ms
- Throttle scroll events : 16ms
- Precache images : 2 écrans avant
- ShaderMask limité : pas sur scroll
- AvoidOpacityAnimation : prefer AnimatedOpacity
- ReduceAnimations : respecte MediaQuery
```

---

## 11. Prompts OpenCode 2026 — "Spécification cinématique"

### Prompt template universel

```
Génère [NOM ÉCRAN] pour Okiba avec les spécifications UI/UX 2026 :

DESIGN SYSTEM :
- Material 3 avec glassmorphism (surfaceGlass, backdropBlur)
- Couleurs : primary #1B5E3F, secondary #E8913A, background #FAFAF7
- Dark mode : primary #34D399, background #0C0A09
- Typography : Inter + Space Grotesk (display uniquement)
- Espacements : multiples de 4, minimum 16px entre sections
- Touch targets : 56dp minimum
- Radius : 16px cards, 12px buttons, 999px pills

ANIMATIONS :
- Page transition : easeOutExpo, 400ms, shared elements
- List stagger : fade + slideY(40→0) + scale(0.92→1.0), 80ms delay
- Button press : scale 0.96 + glow + haptic lightImpact
- Skeleton : shimmer subtil, 2s, easeSmooth
- Success : confetti + chime + haptic pattern 3 coups
- Error : shake + buzz + glow rouge + haptic heavyImpact

INTERACTIONS :
- Pull-to-refresh : elastic + logo rotate
- Swipe actions : haptic + reveal progressif
- Bottom sheet : slide + glass + snap points
- Chat : typing indicator + voice waveform

ACCESSIBILITÉ :
- WCAG AAA contrastes
- VoiceOver labels
- Réduire motion respecté
- Touch targets 56dp
- Font size 200% supporté

ASSETS :
- Logo : OkibaLogo widget (variant mark, size xl)
- Icônes : OkibaIcon widget (category, size, color)
- Images : OkibaImage widget (cache + placeholder)
- Animations : OkibaAnimation widget (type, size)

SPÉCIFIQUE À CET ÉCRAN :
[Description spécifique de l'écran]
```

---

## 12. Checklist Qualité Finale 2026

### Avant chaque écran
- [ ] Marges multiples de 4 partout
- [ ] Max 3 niveaux typographiques visibles
- [ ] Touch targets ≥ 56x56dp
- [ ] Contraste WCAG AAA (7:1)
- [ ] Dark mode testé
- [ ] Glassmorphism testé (light + dark)
- [ ] Glow subtil sur éléments actifs
- [ ] Empty state prévu avec animation Lottie
- [ ] Error state prévu avec animation empathie
- [ ] Loading state = skeleton respirant
- [ ] Haptic feedback sur actions principales
- [ ] Retour arrière géré avec animation
- [ ] Réduire motion respecté
- [ ] VoiceOver labels

### Avant chaque animation
- [ ] Durée 100-500ms (pas plus)
- [ ] Courbe easeOutQuart ou easeOutExpo
- [ ] Pas d'animation sur premier chargement (sauf stagger)
- [ ] 60fps sur device physique moyen
- [ ] Jank < 2%

### Avant release
- [ ] Testé sur Android 8+ (petit écran 320px)
- [ ] Testé sur iOS (si applicable)
- [ ] Testé en 2G/3G (network throttling)
- [ ] Testé offline complet
- [ ] Testé en français et anglais
- [ ] Testé avec font size 200%
- [ ] Testé TalkBack/VoiceOver
- [ ] Testé réduire motion
- [ ] Testé haute contrast
- [ ] App size < 25MB
- [ ] Cold start < 2s
- [ ] Scroll 60fps
- [ ] Pas de valeurs magiques (tout vient des tokens)
- [ ] Pas de dépendance inutile

---

> **Design supérieur 2026** — Calme, cinéma, confiance, contexte, humanité  
> **Dernière mise à jour :** 2026-05-21
