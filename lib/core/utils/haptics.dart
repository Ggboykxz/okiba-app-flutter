import 'package:flutter/services.dart';

class AppHaptics {
  AppHaptics._();

  static void light() => HapticFeedback.lightImpact();
  static void medium() => HapticFeedback.mediumImpact();
  static void heavy() => HapticFeedback.heavyImpact();
  static void selection() => HapticFeedback.selectionClick();

  // 2026 — Langage tactile complet

  // Button press & release
  static void buttonPress() => HapticFeedback.lightImpact();
  static void buttonRelease() => HapticFeedback.selectionClick();

  // Navigation
  static void tabChange() => HapticFeedback.lightImpact();
  static void scrollSnap() => HapticFeedback.selectionClick();

  // Actions
  static void addToCart() {
    HapticFeedback.mediumImpact();
    Future.delayed(const Duration(milliseconds: 50), () {
      HapticFeedback.selectionClick();
    });
  }

  static void toggleSwitch() => HapticFeedback.lightImpact();
  static void filterSelect() => HapticFeedback.selectionClick();
  static void swipeDelete() => HapticFeedback.heavyImpact();
  static void longPress() => HapticFeedback.mediumImpact();

  // Payment patterns
  static void paymentSuccess() {
    HapticFeedback.mediumImpact();
    Future.delayed(const Duration(milliseconds: 120), () {
      HapticFeedback.selectionClick();
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      HapticFeedback.lightImpact();
    });
  }

  static void paymentFailure() {
    HapticFeedback.heavyImpact();
    Future.delayed(const Duration(milliseconds: 80), () {
      HapticFeedback.heavyImpact();
    });
  }

  // Delivery
  static void newDelivery() => HapticFeedback.heavyImpact();
  static void deliveryAccepted() {
    HapticFeedback.mediumImpact();
    Future.delayed(const Duration(milliseconds: 80), () {
      HapticFeedback.selectionClick();
    });
  }

  static void deliveryCompleted() {
    HapticFeedback.mediumImpact();
    Future.delayed(const Duration(milliseconds: 100), () {
      HapticFeedback.selectionClick();
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      HapticFeedback.lightImpact();
    });
  }

  // Celebration & error
  static void celebration() {
    HapticFeedback.mediumImpact();
    Future.delayed(const Duration(milliseconds: 100), () {
      HapticFeedback.selectionClick();
    });
    Future.delayed(const Duration(milliseconds: 180), () {
      HapticFeedback.lightImpact();
    });
  }

  static void error() => HapticFeedback.heavyImpact();

  static void shake() {
    HapticFeedback.heavyImpact();
    Future.delayed(const Duration(milliseconds: 100), () {
      HapticFeedback.heavyImpact();
    });
  }

  // Context-based
  static void onFocus() => HapticFeedback.lightImpact();
  static void onValid() => HapticFeedback.selectionClick();
  static void onRefresh() => HapticFeedback.mediumImpact();

  /// Play a haptic pattern from a list of (delay, impact) tuples.
  /// Example: pattern for payment success → [(0, medium), (120, selection), (200, light)]
  static void playPattern(List<(int, VoidCallback)> pattern) {
    for (final (delay, impact) in pattern) {
      Future.delayed(Duration(milliseconds: delay), impact);
    }
  }
}
