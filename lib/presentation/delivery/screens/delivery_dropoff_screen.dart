import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class DeliveryDropoffScreen extends StatelessWidget {
  final String deliveryId;
  const DeliveryDropoffScreen({super.key, required this.deliveryId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.delivery_dropoff_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Center(
            child: Container(
              width: 120, height: 120,
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded, size: 64, color: Colors.green),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          Center(
            child: Text(l10n.delivery_dropoff_success, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          ),
          Center(
            child: Text('2 000 FCFA ajoutés à votre solde',
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: AppSpacing.space32),
          Text(l10n.delivery_dropoff_scan_client, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Container(
            width: double.infinity, height: 200,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner_rounded, size: 48, color: colorScheme.primary),
                  const SizedBox(height: AppSpacing.space8),
                  Text('Scannez le QR code du client', style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_dropoff_photo, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
              border: Border.all(color: colorScheme.outlineVariant, style: BorderStyle.solid),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_rounded, size: 32, color: colorScheme.onSurfaceVariant),
                  const SizedBox(height: 4),
                  Text(l10n.delivery_dropoff_add_photo, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_dropoff_signature, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Center(
              child: Text('Espace signature (à intégrer)', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              icon: const Icon(Icons.check_rounded),
              label: Text(l10n.delivery_dropoff_finalize),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
        ],
      ),
    );
  }
}
