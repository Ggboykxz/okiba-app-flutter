import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close_rounded, size: 56, color: colorScheme.error),
              ),
              const SizedBox(height: AppSpacing.space32),
              Text(
                AppLocalizations.of(context)!.checkout_failed,
                style: textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.space12),
              Text(
                AppLocalizations.of(context)!.checkout_failed_desc,
                style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.space32),
              // Error details
              Container(
                padding: const EdgeInsets.all(AppSpacing.space16),
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(AppSpacing.radius12),
                  border: Border.all(color: colorScheme.errorContainer),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline_rounded, color: colorScheme.error, size: 20),
                    const SizedBox(width: AppSpacing.space12),
                    Expanded(
                      child: Text(
                        'Transaction refusée par l\'opérateur.\nVérifiez votre solde et réessayez.',
                        style: textTheme.bodySmall?.copyWith(color: colorScheme.error),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.space40),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton.icon(
                  onPressed: () => context.go(RoutePaths.paymentProcessing),
                  icon: const Icon(Icons.refresh_rounded),
                  label: Text(AppLocalizations.of(context)!.general_retry),
                ),
              ),
              const SizedBox(height: AppSpacing.space16),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: OutlinedButton.icon(
                  onPressed: () => context.go(RoutePaths.checkoutPayment),
                  icon: const Icon(Icons.credit_card_rounded),
                  label: Text(AppLocalizations.of(context)!.general_retry),
                ),
              ),
              const SizedBox(height: AppSpacing.space16),
              TextButton(
                onPressed: () => context.go(RoutePaths.clientHome),
                child: const Text('Revenir à l\'accueil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
