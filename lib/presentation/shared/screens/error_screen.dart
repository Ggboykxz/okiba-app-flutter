import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_spacing.dart';

class ErrorScreen extends StatelessWidget {
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onRetry;
  final IconData icon;

  const ErrorScreen({
    super.key,
    this.title = 'Une erreur est survenue',
    this.message = 'Veuillez réessayer plus tard.',
    this.actionLabel = 'Réessayer',
    this.onRetry,
    this.icon = Icons.warning_rounded,
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
                    colorScheme.error.withValues(alpha: 0.4),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: AppSpacing.space24),
                Icon(icon, size: 48, color: colorScheme.error),
                const SizedBox(height: AppSpacing.space16),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.space12),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
                if (onRetry != null) ...[
                  const SizedBox(height: AppSpacing.space32),
                  SizedBox(
                    width: double.infinity,
                    height: AppSpacing.touchMin,
                    child: ElevatedButton.icon(
                      onPressed: onRetry,
                      icon: const Icon(Icons.refresh, size: 20),
                      label: Text(actionLabel!),
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
