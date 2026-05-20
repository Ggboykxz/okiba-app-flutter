import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class BoutiqueWalletScreen extends StatelessWidget {
  const BoutiqueWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.boutiqueWalletTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Balance card
          Card(
            color: colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space24),
              child: Column(
                children: [
                  Text(l10n.boutiqueWalletBalance, style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary.withValues(alpha: 0.8))),
                  const SizedBox(height: AppSpacing.space8),
                  Text('2 450 000 FCFA',
                    style: textTheme.headlineLarge?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.w700)),
                  const SizedBox(height: AppSpacing.space16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.trending_up_rounded, color: colorScheme.onPrimary, size: 20),
                      const SizedBox(width: 6),
                      Text(l10n.boutiqueWalletVsLastMonth('15'),
                        style: textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary.withValues(alpha: 0.8))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Withdraw
          Text(l10n.boutiqueWalletWithdraw, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone_android_rounded, color: colorScheme.primary),
                  title: Text(l10n.boutiqueWalletOrangeMoney),
                  subtitle: const Text('+241 74 12 34 56'),
                  trailing: const Icon(Icons.check_circle_rounded, color: Colors.green),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.account_balance_rounded, color: colorScheme.secondary),
                  title: Text(l10n.boutiqueWalletBank),
                  subtitle: const Text('BGFI Bank •••• 1234'),
                  trailing: const Icon(Icons.check_circle_rounded, color: Colors.green),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          FilledButton.icon(
            icon: const Icon(Icons.send_rounded),
            label: Text(l10n.boutiqueWalletMakeWithdrawal),
            onPressed: () => _showWithdrawSheet(context),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Transactions
          Text(l10n.boutiqueWalletRecent, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _transaction(l10n.boutiqueWalletSale, '+25 000 FCFA', '12 mai 2026', true, colorScheme, textTheme),
          _transaction(l10n.boutiqueWalletWithdrawalOm, '-50 000 FCFA', '10 mai 2026', false, colorScheme, textTheme),
          _transaction(l10n.boutiqueWalletSale, '+15 000 FCFA', '9 mai 2026', true, colorScheme, textTheme),
          _transaction(l10n.boutiqueWalletSale, '+32 000 FCFA', '8 mai 2026', true, colorScheme, textTheme),
          _transaction(l10n.boutiqueWalletWithdrawalBank, '-200 000 FCFA', '5 mai 2026', false, colorScheme, textTheme),
        ],
      ),
    );
  }

  Widget _transaction(String label, String amount, String date, bool isInflow, ColorScheme colorScheme, TextTheme textTheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isInflow ? Colors.green.withValues(alpha: 0.1) : colorScheme.error.withValues(alpha: 0.1),
          child: Icon(isInflow ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
            color: isInflow ? Colors.green : colorScheme.error),
        ),
        title: Text(label),
        subtitle: Text(date, style: textTheme.bodySmall),
        trailing: Text(amount, style: textTheme.titleSmall?.copyWith(
          color: isInflow ? Colors.green : colorScheme.error,
          fontWeight: FontWeight.w600,
        )),
      ),
    );
  }

  void _showWithdrawSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final amountController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.space16,
          AppSpacing.space16,
          AppSpacing.space16,
          MediaQuery.of(ctx).viewInsets.bottom + AppSpacing.space16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.boutiqueWalletMakeWithdrawal, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.space16),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: l10n.boutiqueWalletAmount,
                prefixText: '${l10n.currencyFcfa} ',
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
            DropdownButtonFormField<String>(
              initialValue: l10n.boutiqueWalletOrangeMoney,
              decoration: InputDecoration(labelText: l10n.boutiqueWalletMethod),
              items: [l10n.boutiqueWalletOrangeMoney, 'MTN MoMo', 'Airtel Money', l10n.boutiqueWalletBank]
                  .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                  .toList(),
              onChanged: (_) {},
            ),
            const SizedBox(height: AppSpacing.space24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () { Navigator.pop(ctx); },
                child: Text(l10n.boutiqueWalletConfirmWithdrawal),
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
          ],
        ),
      ),
    );
  }
}
