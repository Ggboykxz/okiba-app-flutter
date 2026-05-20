import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/navigation/route_names.dart';

class SellerWhatsAppScreen extends StatelessWidget {
  const SellerWhatsAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.sellerWhatsappTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Carte statut WhatsApp
          Container(
            padding: const EdgeInsets.all(AppSpacing.space20),
            decoration: BoxDecoration(
              color: AppColors.whatsapp.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
              border: Border.all(
                color: AppColors.whatsapp.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: AppColors.whatsapp,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chat_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: AppSpacing.space16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.sellerWhatsappConnected,
                        style: textTheme.titleMedium?.copyWith(
                          color: AppColors.whatsapp,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.sellerWhatsappDesc,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: true,
                  activeThumbColor: AppColors.whatsapp,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Statistiques
          Text(l10n.sellerSalesToday, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Row(
            children: [
              Expanded(
                child: _statCard(
                  '3',
                  l10n.sellerWhatsappOrdersNew,
                  Icons.shopping_bag_rounded,
                  colorScheme.primary,
                  colorScheme,
                  textTheme,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _statCard(
                  '15',
                  l10n.sellerWhatsappMessages,
                  Icons.chat_rounded,
                  colorScheme.secondary,
                  colorScheme,
                  textTheme,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _statCard(
                  '12 500',
                  '${l10n.currencyFcfa}\n${l10n.boutiqueSales}',
                  Icons.trending_up_rounded,
                  AppColors.whatsapp,
                  colorScheme,
                  textTheme,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          // Partager catalogue
          Text(l10n.sellerWhatsappCatalog, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          SizedBox(
            height: AppSpacing.touchMin,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.push(RoutePaths.whatsappProductCreate),
              icon: const Icon(Icons.share_rounded),
              label: Text(l10n.sellerWhatsappShareCatalog),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whatsapp,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          SizedBox(
            height: AppSpacing.touchMin,
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => context.push(RoutePaths.whatsappStats),
              icon: const Icon(Icons.bar_chart_rounded),
              label: Text(l10n.sellerWhatsappStats),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Commandes récentes WhatsApp
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${l10n.sellerOrders} ${l10n.generalSeeAll?.toLowerCase() ?? ''}', style: textTheme.titleLarge),
              TextButton(
                onPressed: () => context.push(RoutePaths.whatsappOrders),
                child: Text(l10n.generalSeeAll),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space12),
          _orderCard(
            'Alice M.',
            'Chemise traditionnelle x2',
            '30 000 FCFA',
            'En attente',
            colorScheme,
            textTheme,
            onTap: () => context.push(RoutePaths.whatsappOrderDetail.replaceAll(':id', 'Alice M.')),
          ),
          _orderCard(
            'Pierre K.',
            'Poulet braisé x1',
            '5 500 FCFA',
            'Confirmé',
            colorScheme,
            textTheme,
            confirmed: true,
            onTap: () => context.push(RoutePaths.whatsappOrderDetail.replaceAll(':id', 'Pierre K.')),
          ),
          _orderCard(
            'Marie N.',
            'Meuble salon x1',
            '250 000 FCFA',
            'Livré',
            colorScheme,
            textTheme,
            delivered: true,
            onTap: () => context.push(RoutePaths.whatsappOrderDetail.replaceAll(':id', 'Marie N.')),
          ),
        ],
      ),
    );
  }

  Widget _statCard(
    String value,
    String label,
    IconData icon,
    Color color,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: AppSpacing.space8),
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.space4),
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _orderCard(
    String client,
    String product,
    String total,
    String status,
    ColorScheme colorScheme,
    TextTheme textTheme, {
    bool confirmed = false,
    bool delivered = false,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: colorScheme.surfaceContainerHighest,
              child: Text(
                client[0],
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(client, style: textTheme.titleSmall),
                  const SizedBox(height: 2),
                  Text(
                    product,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    total,
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.space8,
                    vertical: AppSpacing.space4,
                  ),
                  decoration: BoxDecoration(
                    color: delivered
                        ? colorScheme.primary.withValues(alpha: 0.1)
                        : confirmed
                            ? colorScheme.secondary.withValues(alpha: 0.1)
                            : colorScheme.surfaceContainerHighest,
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Text(
                    status,
                    style: textTheme.labelSmall?.copyWith(
                      color: delivered
                          ? colorScheme.primary
                          : confirmed
                              ? colorScheme.secondary
                              : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.space8),
                IconButton(
                  icon: const Icon(Icons.chat_rounded, size: 20),
                  color: AppColors.whatsapp,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
