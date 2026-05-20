import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import 'package:go_router/go_router.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String notificationId;
  const NotificationDetailScreen({super.key, required this.notificationId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.notifications_detail_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Center(
            child: Container(
              width: 64, height: 64,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.shopping_bag_rounded, size: 32, color: colorScheme.primary),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          Center(
            child: Text(l10n.notifications_type_order_confirmed,
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: AppSpacing.space8),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space12, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              child: Text('Aujourd\'hui à 12:30',
                style: textTheme.labelSmall?.copyWith(color: colorScheme.onPrimaryContainer)),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.notifications_detail_details, style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.space12),
                  Text(
                    'Votre commande #OKB-2024-001 a été confirmée. '
                    'Le vendeur prépare votre colis. Vous recevrez une notification '
                    'dès que la livraison sera en cours.',
                    style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.notifications_detail_order, style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.space12),
                  _infoRow(l10n.notifications_detail_number, '#OKB-2024-001', colorScheme, textTheme),
                  const Divider(height: AppSpacing.space16),
                  _infoRow(l10n.notifications_detail_status, 'Confirmée', colorScheme, textTheme),
                  const Divider(height: AppSpacing.space16),
                  _infoRow(l10n.notifications_detail_total, '15 000 FCFA', colorScheme, textTheme, valueColor: colorScheme.primary),
                  const Divider(height: AppSpacing.space16),
                  _infoRow(l10n.notifications_detail_seller, 'Adélaïde Styles', colorScheme, textTheme),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: FilledButton.icon(
              icon: const Icon(Icons.shopping_bag_rounded),
              label: Text(l10n.notifications_detail_view_order),
              onPressed: () => context.pop(),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value, ColorScheme colorScheme, TextTheme textTheme, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
        Text(value, style: textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: valueColor ?? colorScheme.onSurface),
        ),
      ],
    );
  }
}
