import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';
import '../../widgets/address_card.dart';
import '../../widgets/payment_method_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;
  int _selectedAddress = 0;
  int _selectedPayment = 0;

  void _onNext() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    } else {
      context.go(RoutePaths.orders);
    }
  }

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
        title: Text(
          _currentStep == 0
              ? AppLocalizations.of(context)!.checkout_address
              : _currentStep == 1
                  ? AppLocalizations.of(context)!.checkout_payment
                  : AppLocalizations.of(context)!.checkout_success,
        ),
      ),
      body: Column(
        children: [
          // Stepper
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space32,
              vertical: AppSpacing.space16,
            ),
            child: Row(
              children: List.generate(3, (i) {
                return Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: i <= _currentStep
                              ? colorScheme.primary
                              : colorScheme.surfaceContainerHighest,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: i < _currentStep
                              ? Icon(
                                  Icons.check_rounded,
                                  size: 16,
                                  color: colorScheme.onPrimary,
                                )
                              : Text(
                                  '${i + 1}',
                                  style: textTheme.labelMedium?.copyWith(
                                    color: i <= _currentStep
                                        ? colorScheme.onPrimary
                                        : colorScheme.onSurfaceVariant,
                                  ),
                                ),
                        ),
                      ),
                      if (i < 2)
                        Expanded(
                          child: Container(
                            height: 2,
                            color: i < _currentStep
                                ? colorScheme.primary
                                : colorScheme.surfaceContainerHighest,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _currentStep,
              children: [
                _buildAddressStep(colorScheme, textTheme),
                _buildPaymentStep(colorScheme, textTheme),
                _buildConfirmationStep(colorScheme, textTheme),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.space16,
          AppSpacing.space12,
          AppSpacing.space16,
          AppSpacing.space32,
        ),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(
            top: BorderSide(color: colorScheme.outlineVariant),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: ElevatedButton(
              onPressed: _onNext,
              child: Text(
                _currentStep == 0
                    ? 'Continuer vers le paiement'
                    : _currentStep == 1
                        ? 'Confirmer la commande'
                        : 'Voir mes commandes',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressStep(ColorScheme colorScheme, TextTheme textTheme) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
      children: [
        AddressCard(
          name: 'Alice Mbazoghe',
          phone: '+241 62 00 00 01',
          address: 'Libreville, Quartier Louis, Avenue Monseigneur, Immeuble F2',
          label: 'Domicile',
          isSelected: _selectedAddress == 0,
          onTap: () => setState(() => _selectedAddress = 0),
        ),
        AddressCard(
          name: 'Alice Mbazoghe',
          phone: '+241 62 00 00 01',
          address: 'Libreville, Centre-ville, Rue de la Paix, Bâtiment A',
          label: 'Bureau',
          isSelected: _selectedAddress == 1,
          onTap: () => setState(() => _selectedAddress = 1),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_rounded),
              label: Text('${AppLocalizations.of(context)!.general_add} ${AppLocalizations.of(context)!.checkout_address}'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentStep(ColorScheme colorScheme, TextTheme textTheme) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
      children: [
        const SizedBox(height: AppSpacing.space8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
          child: Text(
            'Choisissez votre moyen de paiement',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.space16),
        InkWell(
          onTap: () => setState(() => _selectedPayment = 0),
          child: PaymentMethodCard(
            method: 'orange_money',
            label: AppLocalizations.of(context)!.checkout_orange_money,
            icon: Icons.phone_android_rounded,
            iconColor: const Color(0xFFFF6B00),
            isSelected: _selectedPayment == 0,
            onTap: () {},
          ),
        ),
        InkWell(
          onTap: () => setState(() => _selectedPayment = 1),
          child: PaymentMethodCard(
            method: 'mtn_momo',
            label: AppLocalizations.of(context)!.checkout_mtn_momo,
            icon: Icons.phone_android_rounded,
            iconColor: const Color(0xFFFFCC00),
            isSelected: _selectedPayment == 1,
            onTap: () {},
          ),
        ),
        InkWell(
          onTap: () => setState(() => _selectedPayment = 2),
          child: PaymentMethodCard(
            method: 'airtel_money',
            label: AppLocalizations.of(context)!.checkout_airtel_money,
            icon: Icons.phone_android_rounded,
            iconColor: const Color(0xFFED1C24),
            isSelected: _selectedPayment == 2,
            onTap: () {},
          ),
        ),
        InkWell(
          onTap: () => setState(() => _selectedPayment = 3),
          child: PaymentMethodCard(
            method: 'card',
            label: AppLocalizations.of(context)!.checkout_card,
            icon: Icons.credit_card_rounded,
            iconColor: const Color(0xFF6366F1),
            isSelected: _selectedPayment == 3,
            onTap: () {},
          ),
        ),
        InkWell(
          onTap: () => setState(() => _selectedPayment = 4),
          child: PaymentMethodCard(
            method: 'cash',
            label: AppLocalizations.of(context)!.checkout_cash,
            icon: Icons.money_rounded,
            isSelected: _selectedPayment == 4,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmationStep(ColorScheme colorScheme, TextTheme textTheme) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.space16),
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check_rounded,
            size: 40,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: AppSpacing.space24),
          Text(
            AppLocalizations.of(context)!.checkout_success,
            style: textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: AppSpacing.space8),
        Text(
          'Votre commande #OKB-2024-001\nest en cours de préparation.',
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.space32),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.space16),
            child: Column(
              children: [
                _confirmationRow(
                  AppLocalizations.of(context)!.checkout_review_items,
                  '3 articles',
                  textTheme,
                  colorScheme,
                ),
                const SizedBox(height: AppSpacing.space8),
                _confirmationRow(
                  AppLocalizations.of(context)!.checkout_review_payment,
                  'Orange Money',
                  textTheme,
                  colorScheme,
                ),
                const SizedBox(height: AppSpacing.space8),
                _confirmationRow(
                  AppLocalizations.of(context)!.checkout_review_delivery,
                  '~ 2h',
                  textTheme,
                  colorScheme,
                ),
                const Divider(height: AppSpacing.space16),
                _confirmationRow(
                  AppLocalizations.of(context)!.order_total,
                  '77 500 FCFA',
                  textTheme,
                  colorScheme,
                  isTotal: true,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.space24),
        SizedBox(
          width: double.infinity,
          height: AppSpacing.touchMin,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share_rounded),
            label: Text(AppLocalizations.of(context)!.general_share),
          ),
        ),
      ],
    );
  }

  Widget _confirmationRow(
    String label,
    String value,
    TextTheme textTheme,
    ColorScheme colorScheme, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? textTheme.titleSmall
              : textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
        ),
        Text(
          value,
          style: isTotal
              ? textTheme.titleMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                )
              : textTheme.titleSmall,
        ),
      ],
    );
  }
}
