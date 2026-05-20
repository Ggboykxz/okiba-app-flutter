import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/navigation/route_names.dart';

class WhatsAppProductDetailScreen extends StatelessWidget {
  final String productId;

  const WhatsAppProductDetailScreen({super.key, required this.productId});

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
        title: Text(l10n.sellerWhatsappProductDetail),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_rounded),
            onPressed: () => context.push(
              RoutePaths.whatsappProductEdit.replaceAll(':id', productId),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Image placeholder
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
            ),
            child: Center(
              child: Icon(Icons.image_rounded, size: 64, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4)),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Name + price
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Chemise traditionnelle', style: textTheme.headlineMedium),
              ),
              Text('15 000 FCFA', style: textTheme.titleLarge?.copyWith(
                color: colorScheme.primary, fontWeight: FontWeight.w700,
              )),
            ],
          ),
          const SizedBox(height: AppSpacing.space16),
          // Status toggle
          Container(
            padding: const EdgeInsets.all(AppSpacing.space16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Row(
              children: [
                Icon(Icons.visibility_rounded, color: colorScheme.primary),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.sellerWhatsappPublished, style: textTheme.titleSmall),
                      Text(l10n.sellerWhatsappVisible, style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      )),
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
          // Share actions
          Text(l10n.generalShare, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share_rounded),
              label: Text(l10n.sellerWhatsappShare),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whatsapp,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.link_rounded),
              label: Text(l10n.sellerWhatsappCopyLink),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_rounded),
              label: Text(l10n.sellerWhatsappQrCode),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Description
          Text(l10n.productDescription, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space8),
          Text(
            'Chemise traditionnelle gabonaise en pagne wax.\n\n\u2022 100% coton\n\u2022 Taille unique\n\u2022 Lavage 30\u00b0C',
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant, height: 1.5),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Stats
          Text(l10n.sellerWhatsappStatsTitle, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Row(
            children: [
              _miniStat(l10n.sellerWhatsappViews, '156', Icons.visibility_rounded, colorScheme, textTheme),
              const SizedBox(width: AppSpacing.space12),
              _miniStat(l10n.sellerWhatsappClicks, '43', Icons.touch_app_rounded, colorScheme, textTheme),
              const SizedBox(width: AppSpacing.space12),
              _miniStat(l10n.sellerWhatsappSales, '12', Icons.shopping_bag_rounded, colorScheme, textTheme),
            ],
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _miniStat(String label, String value, IconData icon, ColorScheme colorScheme, TextTheme textTheme) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.space12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: colorScheme.primary),
            const SizedBox(height: 4),
            Text(value, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
            Text(label, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
