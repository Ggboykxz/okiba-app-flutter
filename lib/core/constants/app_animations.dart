import 'dart:math' as math;
import 'package:flutter/material.dart';

class AppAnimations {
  AppAnimations._();

  // Courbes 2026 — "Mouvement naturel"
  static const Curve easeOutQuart = Curves.easeOut;
  static const Curve easeOutExpo = _EaseOutExpo();
  static const Curve easeSpring = _EaseSpring();
  static const Curve easeBounce = _EaseBounce();
  static const Curve easeSnap = _EaseSnap();

  // Durées 2026 — "Rythme respiratoire"
  static const Duration micro = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 350);
  static const Duration cinematic = Duration(milliseconds: 500);
  static const Duration ambient = Duration(milliseconds: 3000);


}

// easeOutExpo — décélération très douce, premium
class _EaseOutExpo extends Curve {
  const _EaseOutExpo();
  @override
  double transformInternal(double t) {
    return t == 1.0 ? 1.0 : 1.0 - (1.0 / (1.0 + 12.0 * t));
  }
}

// easeSpring — rebond subtil (elasticOut modifié)
class _EaseSpring extends Curve {
  const _EaseSpring();
  @override
  double transformInternal(double t) {
    const c4 = 2.0943951;
    return t == 0.0 || t == 1.0
        ? t
        : 1.0 +
            (1.0 - t) * (1.0 - t) * (1.0 - t) *
                (1.0 - t) * (1.0 - t) *
                (t * 2.0 - 2.0 + (1.0 - t) * 2.0 * c4);
  }
}

// easeBounce — rebond joyeux limité (bounceOut modifié)
class _EaseBounce extends Curve {
  const _EaseBounce();
  @override
  double transformInternal(double t) {
    if (t < 0.5) {
      return (1.0 - _bounceOut(1.0 - 2.0 * t)) * 0.5;
    }
    return _bounceOut(2.0 * t - 1.0) * 0.5 + 0.5;
  }

  double _bounceOut(double t) {
    const n1 = 7.5625;
    const d1 = 2.75;
    if (t < 1.0 / d1) return n1 * t * t;
    if (t < 2.0 / d1) return n1 * (t -= 1.5 / d1) * t + 0.75;
    if (t < 2.5 / d1) return n1 * (t -= 2.25 / d1) * t + 0.9375;
    return n1 * (t -= 2.625 / d1) * t + 0.984375;
  }
}

// easeSnap — snap rapide, fluide
class _EaseSnap extends Curve {
  const _EaseSnap();
  @override
  double transformInternal(double t) {
        return t < 0.5 ? 2.0 * t * t : 1.0 - math.pow(-2.0 * t + 2.0, 2) / 2.0;
  }
}
