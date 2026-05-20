import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class DeliveryNavigationScreen extends StatelessWidget {
  final String deliveryId;
  const DeliveryNavigationScreen({super.key, required this.deliveryId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Course $deliveryId'),
        actions: [
          IconButton(icon: const Icon(Icons.call_rounded), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: colorScheme.surfaceContainerHighest,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_rounded, size: 64, color: colorScheme.onSurfaceVariant),
                    const SizedBox(height: AppSpacing.space16),
                    Text('Carte Google Maps', style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                    Text('Itinéraire : Boutique → Client', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSpacing.space16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.radius16)),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _step(l10n.delivery_navigation_pickup, true, colorScheme, textTheme),
                      Expanded(child: Divider(color: colorScheme.primary)),
                      _step(l10n.delivery_navigation_delivery, false, colorScheme, textTheme),
                      Expanded(child: Divider(color: colorScheme.outlineVariant)),
                      _step(l10n.delivery_navigation_finalize, false, colorScheme, textTheme),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space16),
                  Card(
                    color: colorScheme.surfaceContainerHighest,
                    child: ListTile(
                      leading: const Icon(Icons.store_rounded, color: Colors.green),
                      title: const Text('Adélaïde Styles'),
                      subtitle: const Text('Quartier Louis • 1.2 km'),
                      trailing: IconButton(
                        icon: const Icon(Icons.navigation_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space12),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      icon: const Icon(Icons.qr_code_scanner_rounded),
                      label: Text(l10n.delivery_navigation_scan_pickup),
                      onPressed: () => context.push(
                        RoutePaths.driverPickup.replaceFirst(':id', deliveryId),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _step(String label, bool active, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space8, vertical: 4),
      decoration: BoxDecoration(
        color: active ? colorScheme.primary : colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(label, style: textTheme.labelSmall?.copyWith(
        color: active ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w600,
      )),
    );
  }
}
