import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class RapidFlashSalesScreen extends StatefulWidget {
  const RapidFlashSalesScreen({super.key});

  @override
  State<RapidFlashSalesScreen> createState() => _RapidFlashSalesScreenState();
}

class _RapidFlashSalesScreenState extends State<RapidFlashSalesScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.sellerRapidFlashTitle),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.add_rounded, size: 18),
            label: Text(l10n.sellerRapidFlashCreate),
            onPressed: () => _showCreateSheet(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Active flash sale
          Text(l10n.sellerRapidFlashOngoing, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _flashCard(
            'Soldes éclair — Mode',
            'Chemises, robes, accessoires',
            '-30%',
            '05:23:12',
            '18 ventes',
            true,
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: AppSpacing.space24),
          // Upcoming
          Text(l10n.sellerRapidFlashUpcoming, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _flashCard(
            'Tech Week',
            'Électronique à prix réduits',
            '-20%',
            'Débute dans 2j',
            '0 ventes',
            false,
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: AppSpacing.space16),
          // Past
          Text(l10n.sellerRapidFlashEnded, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _flashCard(
            'Promo de Pâques',
            'Mode & alimentation',
            '-25%',
            'Terminée',
            '32 ventes',
            false,
            colorScheme,
            textTheme,
          ),
          _flashCard(
            'Black Friday',
            'Toute la boutique',
            '-50%',
            'Terminée',
            '89 ventes',
            false,
            colorScheme,
            textTheme,
          ),
        ],
      ),
    );
  }

  Widget _flashCard(
    String title, String subtitle, String discount, String timer, String sales, bool active,
    ColorScheme colorScheme, TextTheme textTheme,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.space16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: active
                    ? [Colors.deepOrange, Colors.orange]
                    : [colorScheme.surfaceContainerHighest, colorScheme.surfaceContainerHighest],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: textTheme.titleMedium?.copyWith(
                      color: active ? Colors.white : colorScheme.onSurface, fontWeight: FontWeight.w700)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: (active ? Colors.white : colorScheme.primary).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                      child: Text(discount, style: textTheme.titleSmall?.copyWith(
                        color: active ? Colors.white : colorScheme.primary, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: textTheme.bodySmall?.copyWith(
                  color: active ? Colors.white70 : colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.space12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.timer_rounded, size: 16, color: active ? Colors.deepOrange : colorScheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text(timer, style: textTheme.labelMedium?.copyWith(
                      color: active ? Colors.deepOrange : colorScheme.onSurfaceVariant,
                      fontWeight: active ? FontWeight.w600 : FontWeight.normal)),
                  ],
                ),
                Text(sales, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final nameController = TextEditingController();
    final discountController = TextEditingController();
    final durationController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.space16, AppSpacing.space16, AppSpacing.space16,
          MediaQuery.of(ctx).viewInsets.bottom + AppSpacing.space16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.sellerRapidFlashNew, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.space16),
            TextField(controller: nameController, decoration: InputDecoration(labelText: l10n.sellerRapidFlashName)),
            const SizedBox(height: AppSpacing.space12),
            TextField(controller: discountController, decoration: InputDecoration(labelText: l10n.sellerRapidFlashDiscount, prefixText: '% ')),
            const SizedBox(height: AppSpacing.space12),
            TextField(controller: durationController, decoration: InputDecoration(labelText: l10n.sellerRapidFlashDuration), keyboardType: TextInputType.number),
            const SizedBox(height: AppSpacing.space24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () { Navigator.pop(ctx); },
                child: Text(l10n.sellerRapidFlashSchedule),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
