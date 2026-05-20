import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class DriverWalletScreen extends StatelessWidget {
  const DriverWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.delivery_wallet_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Card(
            color: colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space24),
              child: Column(
                children: [
                  Text(l10n.delivery_wallet_balance, style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary.withValues(alpha: 0.8))),
                  const SizedBox(height: AppSpacing.space8),
                  Text('12 500 FCFA', style: textTheme.headlineLarge?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.w700)),
                  const SizedBox(height: AppSpacing.space16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_rounded, size: 16, color: colorScheme.onPrimary.withValues(alpha: 0.7)),
                      const SizedBox(width: 6),
                      Text(l10n.delivery_wallet_secure, style: textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary.withValues(alpha: 0.7))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          FilledButton.icon(
            icon: const Icon(Icons.send_rounded),
            label: Text(l10n.delivery_wallet_withdraw_now),
            onPressed: () => _showWithdrawSheet(context),
          ),
          const SizedBox(height: AppSpacing.space16),
          Text(l10n.delivery_wallet_methods, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone_android_rounded, color: colorScheme.primary),
                  title: const Text('Orange Money'),
                  subtitle: const Text('+241 74 12 34 56 • Principal'),
                  trailing: const Icon(Icons.check_circle_rounded, color: Colors.green),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.account_balance_rounded, color: colorScheme.secondary),
                  title: const Text('Compte bancaire'),
                  subtitle: const Text('BGFI Bank •••• 5678'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          TextButton.icon(
            icon: const Icon(Icons.add_rounded, size: 18),
            label: Text(l10n.delivery_wallet_add_method),
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_wallet_history, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _withdrawal('-5 000 FCFA', 'Orange Money', '10 mai 2026', colorScheme, textTheme, l10n),
          _withdrawal('-10 000 FCFA', 'Orange Money', '5 mai 2026', colorScheme, textTheme, l10n),
          _withdrawal('-3 000 FCFA', 'Compte bancaire', '28 avril 2026', colorScheme, textTheme, l10n),
        ],
      ),
    );
  }

  Widget _withdrawal(String amount, String method, String date, ColorScheme colorScheme, TextTheme textTheme, AppLocalizations l10n) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorScheme.error.withValues(alpha: 0.1),
          child: const Icon(Icons.arrow_upward_rounded, color: Colors.red, size: 20),
        ),
        title: Text(amount, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
        subtitle: Text('$method • $date', style: textTheme.bodySmall),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          child: Text(l10n.delivery_wallet_completed, style: const TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  void _showWithdrawSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();
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
            Text(l10n.delivery_wallet_instant, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.space16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: l10n.delivery_wallet_amount, prefixText: 'FCFA '),
            ),
            const SizedBox(height: AppSpacing.space16),
            DropdownButtonFormField<String>(
              initialValue: 'Orange Money',
              decoration: InputDecoration(labelText: l10n.delivery_wallet_to),
              items: ['Orange Money', 'MTN MoMo', 'Airtel Money', 'Compte bancaire']
                  .map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
              onChanged: (_) {},
            ),
            const SizedBox(height: AppSpacing.space24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () { Navigator.pop(ctx); },
                child: Text(l10n.delivery_wallet_confirm),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
