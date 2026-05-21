import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class NewDeliveryRequestScreen extends StatelessWidget {
  final String requestId;
  const NewDeliveryRequestScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.delivery_request_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
            Text('Offre expire dans 12s', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.space24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.delivery_request_amount, style: textTheme.titleLarge),
                        Text('2 000 FCFA', style: textTheme.titleLarge?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.space16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 12, height: 12,
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                            ),
                            Container(width: 2, height: 40, color: colorScheme.outlineVariant),
                          ],
                        ),
                        const SizedBox(width: AppSpacing.space12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.delivery_request_pickup, style: textTheme.labelMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600)),
                              Text('Adélaïde Styles', style: textTheme.titleSmall),
                              Text('Libreville, Quartier Louis\nBoutique "Adélaïde Styles"', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 12, height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: colorScheme.primary),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.space12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.delivery_request_dropoff, style: textTheme.labelMedium?.copyWith(color: colorScheme.secondary, fontWeight: FontWeight.w600)),
                              Text('Alice M.', style: textTheme.titleSmall),
                              Text('Libreville, Centre-ville\nImmeuble OK, Appt 204', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.space16),
                    const Divider(),
                    Row(
                      children: [
                        _infoChip(Icons.route_rounded, '3.2 km', colorScheme, textTheme),
                        const SizedBox(width: AppSpacing.space12),
                        _infoChip(Icons.inventory_2_rounded, 'Chemise wax', colorScheme, textTheme),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    style: OutlinedButton.styleFrom(foregroundColor: colorScheme.error),
                    child: Text(l10n.delivery_request_ignore),
                  ),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  flex: 2,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.check_rounded),
                    label: Text('${l10n.delivery_accept} — 2 000 FCFA'),
                    onPressed: () => context.pushReplacement(
                      RoutePaths.driverNavigation.replaceFirst(':id', requestId),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(text, style: textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
