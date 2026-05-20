import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';
import '../../widgets/payment_method_card.dart';

class CheckoutPaymentScreen extends StatefulWidget {
  const CheckoutPaymentScreen({super.key});

  @override
  State<CheckoutPaymentScreen> createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  int _selected = 0;

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
        title: Text(AppLocalizations.of(context)!.checkout_payment),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.space16, AppSpacing.space16, AppSpacing.space16, 0),
            child: Text('Choisissez votre moyen de paiement', style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            )),
          ),
          const SizedBox(height: AppSpacing.space16),
          InkWell(
            onTap: () => setState(() => _selected = 0),
            child: PaymentMethodCard(
              method: 'orange_money',
              label: AppLocalizations.of(context)!.checkout_orange_money,
              icon: Icons.phone_android_rounded,
              iconColor: const Color(0xFFFF6B00),
              isSelected: _selected == 0,
              onTap: () {},
            ),
          ),
          InkWell(
            onTap: () => setState(() => _selected = 1),
            child: PaymentMethodCard(
              method: 'mtn_momo',
              label: AppLocalizations.of(context)!.checkout_mtn_momo,
              icon: Icons.phone_android_rounded,
              iconColor: const Color(0xFFFFCC00),
              isSelected: _selected == 1,
              onTap: () {},
            ),
          ),
          InkWell(
            onTap: () => setState(() => _selected = 2),
            child: PaymentMethodCard(
              method: 'airtel_money',
              label: AppLocalizations.of(context)!.checkout_airtel_money,
              icon: Icons.phone_android_rounded,
              iconColor: const Color(0xFFED1C24),
              isSelected: _selected == 2,
              onTap: () {},
            ),
          ),
          InkWell(
            onTap: () => setState(() => _selected = 3),
            child: PaymentMethodCard(
              method: 'card',
              label: AppLocalizations.of(context)!.checkout_card,
              icon: Icons.credit_card_rounded,
              iconColor: const Color(0xFF6366F1),
              isSelected: _selected == 3,
              onTap: () {},
            ),
          ),
          InkWell(
            onTap: () => setState(() => _selected = 4),
            child: PaymentMethodCard(
              method: 'cash',
              label: AppLocalizations.of(context)!.checkout_cash,
              icon: Icons.money_rounded,
              isSelected: _selected == 4,
              onTap: () {},
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
              onPressed: () => context.push(RoutePaths.checkoutReview),
              child: const Text('Continuer vers le récapitulatif'),
            ),
          ),
        ),
      ),
    );
  }
}
