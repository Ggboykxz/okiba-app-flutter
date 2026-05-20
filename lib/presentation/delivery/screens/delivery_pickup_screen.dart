import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class DeliveryPickupScreen extends StatelessWidget {
  final String deliveryId;
  const DeliveryPickupScreen({super.key, required this.deliveryId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.delivery_pickup_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Card(
            color: colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Row(
                children: [
                  Icon(Icons.info_rounded, color: colorScheme.onSecondaryContainer),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: Text(l10n.delivery_pickup_desc,
                      style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSecondaryContainer)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Center(
            child: Container(
              width: 250, height: 250,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppSpacing.radius20),
                border: Border.all(color: colorScheme.outlineVariant, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner_rounded, size: 64, color: colorScheme.primary),
                  const SizedBox(height: AppSpacing.space16),
                  Text(l10n.delivery_pickup_scan, style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          TextField(
            decoration: InputDecoration(
              labelText: l10n.delivery_pickup_or,
              hintText: 'Ex: OKB-2024-001',
              prefixIcon: const Icon(Icons.keyboard_rounded),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_pickup_photo, style: textTheme.titleMedium),
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
                  Text(l10n.delivery_pickup_add_photo, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              icon: const Icon(Icons.check_rounded),
              label: Text(l10n.delivery_pickup_confirm),
              onPressed: () => context.pushReplacement(
                RoutePaths.driverNavigation.replaceFirst(':id', deliveryId),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
        ],
      ),
    );
  }
}
