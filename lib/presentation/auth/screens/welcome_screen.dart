import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';
import '../../../core/widgets/okiba_logo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              OkibaLogo(
                variant: LogoVariant.mark,
                size: LogoSize.xl,
                color: colorScheme.primary,
              ),
              const SizedBox(height: AppSpacing.space24),
              OkibaLogo(
                variant: LogoVariant.wordmark,
                size: LogoSize.xl,
                color: colorScheme.onSurface,
              ),
              const SizedBox(height: AppSpacing.space8),
              Text(
                AppLocalizations.of(context).welcome_subtitle,
                style: textTheme.labelSmall?.copyWith(
                  letterSpacing: 4,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.space48),
              Text(
                AppLocalizations.of(context).welcome_tagline,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(flex: 1),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton(
                  onPressed: () => context.push(RoutePaths.register),
                  child: Text(AppLocalizations.of(context).auth_register),
                ),
              ),
              const SizedBox(height: AppSpacing.space16),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: OutlinedButton(
                  onPressed: () => context.push(RoutePaths.login),
                  child: Text(AppLocalizations.of(context).auth_login_button),
                ),
              ),
              const SizedBox(height: AppSpacing.space24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'FR',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space8),
                  Text(
                    '|',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'EN',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space8),
            ],
          ),
        ),
      ),
    );
  }
}
