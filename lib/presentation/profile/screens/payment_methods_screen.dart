import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String _defaultMethod = 'Orange Money';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_payment_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Text(l10n.profile_payment_mobile_money, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _methodCard('Orange Money', '+241 74 12 34 56', Icons.phone_android_rounded, colorScheme, textTheme, true, l10n),
          const SizedBox(height: AppSpacing.space8),
          _methodCard('MTN MoMo', '+241 62 00 00 01', Icons.phone_android_rounded, colorScheme, textTheme, false, l10n),
          const SizedBox(height: AppSpacing.space8),
          _methodCard('Airtel Money', '+241 77 00 00 02', Icons.phone_android_rounded, colorScheme, textTheme, false, l10n),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_payment_cards, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: ListTile(
              leading: Icon(Icons.credit_card_rounded, color: colorScheme.onSurfaceVariant),
              title: Text(l10n.profile_payment_add_card),
              subtitle: const Text('Visa, Mastercard'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {},
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_payment_cash, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: ListTile(
              leading: Icon(Icons.money_rounded, color: Colors.green),
              title: const Text('Paiement à la livraison'),
              subtitle: const Text('Disponible pour toutes les commandes'),
              trailing: const Icon(Icons.check_rounded, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget _methodCard(String name, String detail, IconData icon, ColorScheme colorScheme, TextTheme textTheme, bool isDefault, AppLocalizations l10n) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () => setState(() => _defaultMethod = name),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Row(
            children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSpacing.radius12),
                ),
                child: Icon(icon, color: colorScheme.onPrimaryContainer),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: textTheme.titleSmall),
                        if (isDefault) ...[
                          const SizedBox(width: AppSpacing.space8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                            ),
                            child: Text(l10n.profile_payment_default, style: textTheme.labelSmall?.copyWith(color: colorScheme.primary, fontSize: 9)),
                          ),
                        ],
                      ],
                    ),
                    Text(detail, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
              Icon(
                name == _defaultMethod ? Icons.radio_button_checked_rounded : Icons.radio_button_unchecked_rounded,
                color: name == _defaultMethod ? colorScheme.primary : colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
