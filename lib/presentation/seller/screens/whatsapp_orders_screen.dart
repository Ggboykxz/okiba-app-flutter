import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class WhatsAppOrdersScreen extends StatelessWidget {
  const WhatsAppOrdersScreen({super.key});

  static const _orders = [
    _WAOrder('Alice M.', '+241 62 00 00 01', 'Chemise traditionnelle x2', '30 000 FCFA', 'En attente', 'Aujourd\'hui, 14h30'),
    _WAOrder('Pierre K.', '+241 62 00 00 02', 'Poulet braisé x1', '5 500 FCFA', 'Confirmé', 'Aujourd\'hui, 11h15'),
    _WAOrder('Marie N.', '+241 62 00 00 03', 'Meuble salon x1', '250 000 FCFA', 'Livré', 'Hier, 16h00'),
    _WAOrder('Jean O.', '+241 62 00 00 04', 'Smartphone x1', '85 000 FCFA', 'En attente', 'Hier, 09h20'),
    _WAOrder('Sarah M.', '+241 62 00 00 05', 'Sac en cuir x1', '45 000 FCFA', 'Confirmé', '2026-05-18, 15h45'),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.sellerWhatsappOrdersTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
        children: _orders.map((o) {
          final isConfirmed = o.status == 'Confirmé';
          final isDelivered = o.status == 'Livré';
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.space16, vertical: AppSpacing.space4),
            child: InkWell(
              onTap: () => context.push(
                RoutePaths.whatsappOrderDetail.replaceAll(':id', o.client),
              ),
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      child: Text(o.client[0], style: textTheme.titleSmall),
                    ),
                    const SizedBox(width: AppSpacing.space12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(o.client, style: textTheme.titleSmall),
                          const SizedBox(height: 2),
                          Text(o.phone, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                          const SizedBox(height: 2),
                          Text(o.product, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                          const SizedBox(height: 2),
                          Text(o.total, style: textTheme.titleSmall?.copyWith(
                            color: colorScheme.primary, fontWeight: FontWeight.w700,
                          )),
                          const SizedBox(height: 2),
                          Text(o.date, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDelivered
                            ? colorScheme.primary.withValues(alpha: 0.1)
                            : isConfirmed
                                ? colorScheme.secondary.withValues(alpha: 0.1)
                                : colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                      child: Text(o.status, style: textTheme.labelSmall?.copyWith(
                        color: isDelivered
                            ? colorScheme.primary
                            : isConfirmed
                                ? colorScheme.secondary
                                : colorScheme.onSurfaceVariant,
                      )),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _WAOrder {
  final String client;
  final String phone;
  final String product;
  final String total;
  final String status;
  final String date;
  const _WAOrder(this.client, this.phone, this.product, this.total, this.status, this.date);
}
