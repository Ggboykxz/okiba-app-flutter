import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_spacing.dart';

class EmptyStateScreen extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData? icon;

  const EmptyStateScreen({
    super.key,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onAction,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.space32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/logo/okiba_mark_monochrome.svg',
                  width: 80,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: AppSpacing.space24),
                if (icon != null) ...[
                  Icon(icon!, size: 48, color: colorScheme.onSurfaceVariant),
                  const SizedBox(height: AppSpacing.space16),
                ],
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                  textAlign: TextAlign.center,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppSpacing.space12),
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (actionLabel != null && onAction != null) ...[
                  const SizedBox(height: AppSpacing.space24),
                  SizedBox(
                    width: double.infinity,
                    height: AppSpacing.touchMin,
                    child: ElevatedButton(
                      onPressed: onAction,
                      child: Text(actionLabel!),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
