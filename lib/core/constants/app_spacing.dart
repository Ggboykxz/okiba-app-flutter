class AppSpacing {
  AppSpacing._();

  // Spacing (2026 — grille musicale, multiples de 4)
  static const double space2 = 2;
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space40 = 40;
  static const double space48 = 48;
  static const double space64 = 64;
  static const double space80 = 80;
  static const double space96 = 96;

  // Alias for backwards compat
  static const double xs = space4;
  static const double sm = space8;
  static const double md = space12;
  static const double lg = space16;
  static const double xl = space20;
  static const double xxl = space24;
  static const double xxxl = space32;
  static const double huge = space48;

  // Border radius 2026 — "Morphologie organique"
  static const double radius4 = 4;
  static const double radius8 = 8;
  static const double radius12 = 12;
  static const double radius16 = 16;
  static const double radius20 = 20;
  static const double radius24 = 24;
  static const double radius28 = 28;
  static const double radiusApple = 44;
  static const double radiusFull = 999;

  // Alias for backwards compat
  static const double radiusSm = radius8;
  static const double radiusMd = radius12;
  static const double radiusLg = radius16;

  // Animation durations 2026 — "Rythme respiratoire"
  static const Duration durationMicro = Duration(milliseconds: 100);
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 250);
  static const Duration durationSlow = Duration(milliseconds: 350);
  static const Duration durationCinematic = Duration(milliseconds: 500);
  static const Duration durationAmbient = Duration(milliseconds: 3000);

  // Touch targets (56dp minimum for Gabon market)
  static const double touchMin = 56;
  static const double touchCompact = 48;
  static const double iconSize = 24;
  static const double iconSizeLarge = 32;
  static const double iconSizeCategory = 32;
  static const double avatarSize = 48;
  static const double fabSize = 64;

  // Font sizes
  static const double textXs = 12;
  static const double textSm = 14;
  static const double textMd = 16;
  static const double textLg = 18;
  static const double textXl = 20;
  static const double textXxl = 22;
  static const double textDisplay = 28;

  // Price font sizes
  static const double priceSm = 16;
  static const double priceMd = 20;
  static const double priceLg = 24;
  static const double priceXl = 28;

  // Layout
  static const double gridColumns = 2;
  static const double gridGap = 12;
  static const double cardElevation = 2;
  static const double bottomNavHeight = 80;
  static const double appBarHeight = 64;
  static const double maxContentWidth = 600.0;
}
