import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

class AppTheme {
  AppTheme._();

  static const _seedColor = Color(0xFF1B5E3F);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      surfaceContainerHighest: AppColors.surfaceVariant,
      onSurfaceVariant: AppColors.onSurfaceVariant,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
      shadow: AppColors.shadow,
      scrim: AppColors.scrim,
      inverseSurface: AppColors.inverseSurface,
      onInverseSurface: AppColors.onInverseSurface,
      inversePrimary: AppColors.inversePrimary,
    );

    final textTheme = GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 48, fontWeight: FontWeight.w400, height: 56 / 48,
        letterSpacing: -0.5, color: colorScheme.onSurface,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 40, fontWeight: FontWeight.w400, height: 48 / 40,
        color: colorScheme.onSurface,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 28, fontWeight: FontWeight.w700, height: 36 / 28,
        color: colorScheme.onSurface,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w700, height: 32 / 24,
        color: colorScheme.onSurface,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.w700, height: 28 / 20,
        color: colorScheme.onSurface,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, height: 24 / 16,
        letterSpacing: 0.15, color: colorScheme.onSurface,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, height: 20 / 14,
        letterSpacing: 0.1, color: colorScheme.onSurface,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w400, height: 24 / 16,
        letterSpacing: 0.5, color: colorScheme.onSurface,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w400, height: 20 / 14,
        letterSpacing: 0.25, color: colorScheme.onSurface,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w400, height: 16 / 12,
        letterSpacing: 0.4, color: colorScheme.onSurfaceVariant,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w700, height: 20 / 14,
        letterSpacing: 0.1, color: colorScheme.onSurface,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w700, height: 16 / 12,
        letterSpacing: 0.5, color: colorScheme.onSurface,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11, fontWeight: FontWeight.w700, height: 16 / 11,
        letterSpacing: 0.5, color: colorScheme.onSurfaceVariant,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFFAFAF7),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 2,
        backgroundColor: const Color(0xFFFAFAF7),
        foregroundColor: colorScheme.onSurface,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
        toolbarHeight: AppSpacing.appBarHeight,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      cardTheme: CardThemeData(
        elevation: AppSpacing.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
        ),
        color: colorScheme.surface,
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space16,
          vertical: AppSpacing.space8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: const Size(0, AppSpacing.touchMin),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radius12),
          ),
          textStyle: textTheme.labelLarge?.copyWith(color: colorScheme.onPrimary),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size(0, AppSpacing.touchMin),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space24),
          side: BorderSide(color: colorScheme.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radius12),
          ),
          textStyle: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size(0, AppSpacing.touchCompact),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radius12),
          ),
          textStyle: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space16,
          vertical: AppSpacing.space16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
          borderSide: BorderSide(color: colorScheme.outline, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
          borderSide: BorderSide(color: colorScheme.outline, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
          borderSide: BorderSide(color: colorScheme.primary, width: 3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        labelStyle: textTheme.titleSmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        floatingLabelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.primary,
        ),
        helperStyle: textTheme.bodySmall,
        errorStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 8,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.primary,
        ),
        unselectedLabelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
        shape: const CircleBorder(),
        sizeConstraints: const BoxConstraints.tightFor(
          width: AppSpacing.fabSize,
          height: AppSpacing.fabSize,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: textTheme.labelLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(
          color: colorScheme.onPrimaryContainer,
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
        ),
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        actionTextColor: colorScheme.inversePrimary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radius16),
          ),
        ),
        elevation: 8,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius16),
        ),
        elevation: 8,
      ),
    );
  }

  static ThemeData dark() {
    final base = light();
    final darkScheme = base.colorScheme.copyWith(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      primaryContainer: AppColors.primaryContainerDark,
      onPrimaryContainer: AppColors.onPrimaryContainerDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryDark,
      secondaryContainer: AppColors.secondaryContainerDark,
      onSecondaryContainer: AppColors.onSecondaryContainerDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      surfaceContainerHighest: AppColors.surfaceVariantDark,
      onSurfaceVariant: AppColors.onSurfaceVariantDark,
      outline: AppColors.outlineDark,
      outlineVariant: AppColors.outlineVariantDark,
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
      errorContainer: AppColors.errorContainerDark,
      onErrorContainer: AppColors.onErrorContainerDark,
      inverseSurface: AppColors.inverseSurfaceDark,
      onInverseSurface: AppColors.onInverseSurfaceDark,
      inversePrimary: AppColors.inversePrimaryDark,
    );

    return base.copyWith(
      brightness: Brightness.dark,
      colorScheme: darkScheme,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: darkScheme.onSurface,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      cardTheme: CardThemeData(
        elevation: AppSpacing.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
        ),
        color: darkScheme.surface,
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space16,
          vertical: AppSpacing.space8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: darkScheme.primary,
          foregroundColor: darkScheme.onPrimary,
          minimumSize: const Size(0, AppSpacing.touchMin),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radius12),
          ),
        ),
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        fillColor: darkScheme.surfaceContainerHighest,
        labelStyle: base.inputDecorationTheme.labelStyle?.copyWith(
          color: darkScheme.onSurfaceVariant,
        ),
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        backgroundColor: darkScheme.surface,
        selectedItemColor: darkScheme.primary,
        selectedLabelStyle: null,
        unselectedItemColor: darkScheme.onSurfaceVariant,
        unselectedLabelStyle: null,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        backgroundColor: darkScheme.primary,
        foregroundColor: darkScheme.onPrimary,
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: darkScheme.surfaceContainerHighest,
        selectedColor: darkScheme.primaryContainer,
      ),
      snackBarTheme: base.snackBarTheme.copyWith(
        backgroundColor: darkScheme.inverseSurface,
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: darkScheme.onInverseSurface,
        ),
      ),
    );
  }
}
