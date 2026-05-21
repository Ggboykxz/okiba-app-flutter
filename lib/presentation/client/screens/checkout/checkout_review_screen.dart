import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';

class CheckoutReviewScreen extends StatelessWidget {
  const CheckoutReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(AppLocalizations.of(context).checkout_summary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Address section
          _SectionHeader(textTheme, AppLocalizations.of(context).checkout_address),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: ListTile(
              leading: Icon(Icons.location_on_rounded, color: colorScheme.primary),
              title: const Text('Alice Mbazoghe'),
              subtitle: const Text('Libreville, Quartier Louis\n+241 62 00 00 01'),
              trailing: Icon(Icons.check_circle_rounded, color: colorScheme.primary),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Delivery section
          _SectionHeader(textTheme, AppLocalizations.of(context).checkout_delivery_mode),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: ListTile(
              leading: Icon(Icons.delivery_dining_rounded, color: colorScheme.primary),
              title: const Text('Standard'),
              subtitle: const Text('2 000 FCFA · 2-4h'),
              trailing: Icon(Icons.check_circle_rounded, color: colorScheme.primary),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Payment section
          _SectionHeader(textTheme, AppLocalizations.of(context).checkout_review_payment),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: ListTile(
              leading: Icon(Icons.phone_android_rounded, color: const Color(0xFFFF6B00)),
              title: const Text('Orange Money'),
              subtitle: const Text('Paiement mobile'),
              trailing: Icon(Icons.check_circle_rounded, color: colorScheme.primary),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Items
          _SectionHeader(textTheme, 'Articles (3)'),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: Column(
              children: [
                _ItemRow('Chemise traditionnelle', '15 000 FCFA', '×2', textTheme, colorScheme),
                const Divider(height: 1),
                _ItemRow('Poulet braisé', '5 500 FCFA', '×1', textTheme, colorScheme),
                const Divider(height: 1),
                _ItemRow('Smartphone reconditionné', '85 000 FCFA', '×1', textTheme, colorScheme),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Total
          Card(
            color: colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                children: [
                  _TotalRow('Sous-total', '105 500 FCFA', textTheme, colorScheme),
                  const SizedBox(height: AppSpacing.space4),
                  _TotalRow(AppLocalizations.of(context).checkout_review_delivery, '2 000 FCFA', textTheme, colorScheme),
                  const Divider(height: AppSpacing.space16),
                  _TotalRow(AppLocalizations.of(context).order_total, '107 500 FCFA', textTheme, colorScheme, isTotal: true),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(AppSpacing.space16, AppSpacing.space12, AppSpacing.space16, AppSpacing.space32),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: ElevatedButton(
              onPressed: () => context.push(RoutePaths.paymentProcessing),
              child: Text(AppLocalizations.of(context).checkout_pay('107 500 FCFA')),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final TextTheme textTheme;
  final String title;
  const _SectionHeader(this.textTheme, this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: textTheme.titleSmall);
  }
}

class _ItemRow extends StatelessWidget {
  final String name;
  final String price;
  final String qty;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _ItemRow(this.name, this.price, this.qty, this.textTheme, this.colorScheme);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: textTheme.bodyMedium),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(qty, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
          const SizedBox(width: AppSpacing.space8),
          Text(price, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  final String label;
  final String value;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final bool isTotal;

  const _TotalRow(this.label, this.value, this.textTheme, this.colorScheme, {this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: isTotal ? textTheme.titleSmall : textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        )),
        Text(value, style: isTotal
            ? textTheme.titleLarge?.copyWith(color: colorScheme.onPrimaryContainer, fontWeight: FontWeight.w700)
            : textTheme.titleSmall?.copyWith(color: colorScheme.onPrimaryContainer)),
      ],
    );
  }
}
