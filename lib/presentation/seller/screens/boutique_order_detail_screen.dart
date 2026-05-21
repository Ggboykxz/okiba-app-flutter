import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class BoutiqueOrderDetailScreen extends StatelessWidget {
  final String orderId;
  const BoutiqueOrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final timeline = [
      (l10n.boutique_order_detail_placed, '12 mai 2026 à 14:30', true),
      (l10n.boutique_order_detail_paid, '12 mai 2026 à 14:32', true),
      (l10n.boutique_order_detail_preparing, '13 mai 2026 à 09:00', true),
      (l10n.boutique_order_detail_in_transit, '14 mai 2026 à 10:15', false),
      (l10n.order_status_delivered, '—', false),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(orderId),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Client card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colorScheme.primaryContainer,
                    child: Icon(Icons.person_rounded, color: colorScheme.onPrimaryContainer),
                  ),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Awa Diallo', style: textTheme.titleMedium),
                        Text('+241 74 12 34 56', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        Text('Libreville, Gabon', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                      ],
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.phone_rounded), onPressed: () {}),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Products
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.boutique_order_detail_items, style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.space12),
                  _productRow('Chemise wax', '15 000 FCFA', '×1', colorScheme, textTheme),
                  const Divider(),
                  _productRow('Robe pagne', '25 000 FCFA', '×2', colorScheme, textTheme),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.boutique_order_detail_total, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                      Text('65 000 FCFA', style: textTheme.titleMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Payment info
          Card(
            child: ListTile(
              leading: Icon(Icons.payment_rounded, color: colorScheme.primary),
              title: const Text('Orange Money'),
              subtitle: Text(l10n.boutique_order_detail_paid),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(l10n.boutique_order_detail_paid_status, style: const TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Timeline
          Text(l10n.boutique_order_detail_tracking, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          ...timeline.asMap().entries.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 16, height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: e.value.$3 ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                        border: e.value.$3 ? null : Border.all(color: colorScheme.outlineVariant),
                      ),
                      child: e.value.$3
                          ? const Icon(Icons.check_rounded, size: 10, color: Colors.white)
                          : null,
                    ),
                    if (e.key < timeline.length - 1)
                      Container(width: 2, height: 30, color: e.value.$3 ? colorScheme.primary : colorScheme.outlineVariant),
                  ],
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.value.$1, style: textTheme.titleSmall?.copyWith(
                          fontWeight: e.value.$3 ? FontWeight.w600 : FontWeight.normal,
                          color: e.value.$3 ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                        )),
                        Text(e.value.$2, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: AppSpacing.space24),
          // Actions
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.check_rounded),
                  label: Text(l10n.boutique_order_detail_confirm),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: FilledButton.icon(
                  icon: const Icon(Icons.local_shipping_rounded),
                  label: Text(l10n.boutique_order_detail_ship),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space16),
          OutlinedButton.icon(
            icon: const Icon(Icons.cancel_outlined),
            label: Text(l10n.boutique_order_detail_cancel_order),
            style: OutlinedButton.styleFrom(foregroundColor: colorScheme.error),
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _productRow(String name, String price, String qty, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.space4),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radius8),
            ),
            child: Icon(Icons.image_rounded, size: 20, color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(width: AppSpacing.space12),
          Expanded(child: Text(name, style: textTheme.bodyMedium)),
          Text(qty, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
          const SizedBox(width: AppSpacing.space12),
          Text(price, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
