import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_colors.dart';

class WhatsAppOrderDetailScreen extends StatelessWidget {
  final String orderId;

  const WhatsAppOrderDetailScreen({super.key, required this.orderId});

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
        title: Text(l10n.sellerWhatsappOrderDetail),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Client info
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: colorScheme.primaryContainer,
                    child: Text('A', style: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimaryContainer)),
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Alice M.', style: textTheme.titleMedium),
                        const SizedBox(height: 2),
                        Text('+241 62 00 00 01', style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        )),
                        const SizedBox(height: 2),
                        Text('Aujourd\'hui, 14h30', style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                    ),
                    child: Text(l10n.orderStatusPending, style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Product
          Text('${l10n.boutiqueOrderDetailItems} ${l10n.generalSeeAll?.toLowerCase() ?? ''}', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space12),
              child: Row(
                children: [
                  Container(
                    width: 64, height: 64,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppSpacing.radius8),
                    ),
                    child: Icon(Icons.image_rounded, color: colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chemise traditionnelle', style: textTheme.titleSmall),
                        const SizedBox(height: 4),
                        Text('x2', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        const SizedBox(height: 4),
                        Text('30 000 FCFA', style: textTheme.titleSmall?.copyWith(
                          color: colorScheme.primary, fontWeight: FontWeight.w700,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Actions
          Text(l10n.boutiqueActions, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            width: double.infinity, height: AppSpacing.touchMin,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check_rounded),
              label: Text(l10n.sellerWhatsappOrderConfirm),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whatsapp,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            width: double.infinity, height: AppSpacing.touchMin,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.chat_rounded),
              label: Text(l10n.sellerWhatsappContactWhatsapp),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            width: double.infinity, height: AppSpacing.touchMin,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delivery_dining_rounded),
              label: Text(l10n.sellerWhatsappMarkDelivered),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            width: double.infinity, height: AppSpacing.touchMin,
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.cancel_outlined, color: colorScheme.error),
              label: Text(l10n.sellerWhatsappCancelOrder, style: TextStyle(color: colorScheme.error)),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }
}
