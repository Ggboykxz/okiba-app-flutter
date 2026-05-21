import 'package:flutter/material.dart';
import 'okiba_logo.dart';

enum OnboardingStep {
  buy,
  sell,
  deliver,
  trust,
}

class OnboardingImage extends StatelessWidget {
  final OnboardingStep step;
  final double size;

  const OnboardingImage({
    super.key,
    required this.step,
    this.size = 200,
  });

  String get _assetPath {
    switch (step) {
      case OnboardingStep.buy:
        return 'assets/images/onboarding/onboarding_1.png';
      case OnboardingStep.sell:
        return 'assets/images/onboarding/onboarding_2.png';
      case OnboardingStep.deliver:
        return 'assets/images/onboarding/onboarding_3.png';
      case OnboardingStep.trust:
        return 'assets/images/onboarding/onboarding_4.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _assetPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return OkibaLogo(
          variant: LogoVariant.mark,
          size: _logoSize(),
          animate: true,
        );
      },
    );
  }

  LogoSize _logoSize() {
    if (size <= 40) return LogoSize.md;
    if (size <= 64) return LogoSize.lg;
    if (size <= 100) return LogoSize.xl;
    return LogoSize.xxl;
  }
}
