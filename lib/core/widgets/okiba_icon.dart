import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum IconCategory {
  tab,
  category,
  payment,
  status,
  delivery,
  misc,
}

class OkibaIcon extends StatelessWidget {
  final String name;
  final IconCategory category;
  final double size;
  final Color? color;
  final bool filled;

  const OkibaIcon({
    super.key,
    required this.name,
    required this.category,
    this.size = 24,
    this.color,
    this.filled = false,
  });

  String get _assetPath {
    final cat = category.name;
    final suffix = filled && category == IconCategory.tab ? '_filled' : '';
    return 'assets/icons/$cat/$name$suffix.svg';
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurfaceVariant;

    return SvgPicture.asset(
      _assetPath,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}
