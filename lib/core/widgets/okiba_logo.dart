import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum LogoVariant {
  mark,
  horizontal,
  vertical,
  wordmark,
  appIcon,
  appIconDark,
  monochrome,
}

enum LogoSize {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

class OkibaLogo extends StatelessWidget {
  final LogoVariant variant;
  final LogoSize size;
  final Color? color;
  final bool animate;

  const OkibaLogo({
    super.key,
    this.variant = LogoVariant.mark,
    this.size = LogoSize.md,
    this.color,
    this.animate = false,
  });

  double get _size {
    switch (size) {
      case LogoSize.xs:
        return 16;
      case LogoSize.sm:
        return 24;
      case LogoSize.md:
        return 40;
      case LogoSize.lg:
        return 64;
      case LogoSize.xl:
        return 100;
      case LogoSize.xxl:
        return 140;
    }
  }

  String get _assetPath {
    switch (variant) {
      case LogoVariant.mark:
        return 'assets/logo/okiba_mark.svg';
      case LogoVariant.horizontal:
        return 'assets/logo/okiba_logo_horizontal.svg';
      case LogoVariant.vertical:
        return 'assets/logo/okiba_logo_vertical.svg';
      case LogoVariant.wordmark:
        return 'assets/logo/okiba_wordmark.svg';
      case LogoVariant.appIconDark:
        return 'assets/logo/okiba_app_icon_dark.svg';
      case LogoVariant.appIcon:
        return 'assets/logo/okiba_app_icon.svg';
      case LogoVariant.monochrome:
        return 'assets/logo/okiba_mark_monochrome.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = _size;

    Widget logo = SvgPicture.asset(
      _assetPath,
      width: logoSize,
      height: logoSize,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );

    if (animate) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.8, end: 1.0),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: logo,
          );
        },
      );
    }

    return logo;
  }
}
