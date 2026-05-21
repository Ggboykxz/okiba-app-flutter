import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';
import '../../widgets/address_card.dart';

class CheckoutAddressScreen extends StatefulWidget {
  const CheckoutAddressScreen({super.key});

  @override
  State<CheckoutAddressScreen> createState() => _CheckoutAddressScreenState();
}

class _CheckoutAddressScreenState extends State<CheckoutAddressScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(AppLocalizations.of(context).checkout_address),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: [
          const SizedBox(height: AppSpacing.space8),
          AddressCard(
            name: 'Alice Mbazoghe',
            phone: '+241 62 00 00 01',
            address: 'Libreville, Quartier Louis, Avenue Monseigneur, Immeuble F2',
            label: 'Domicile',
            isSelected: _selected == 0,
            onTap: () => setState(() => _selected = 0),
          ),
          AddressCard(
            name: 'Alice Mbazoghe',
            phone: '+241 62 00 00 01',
            address: 'Libreville, Centre-ville, Rue de la Paix, Bâtiment A',
            label: 'Bureau',
            isSelected: _selected == 1,
            onTap: () => setState(() => _selected = 1),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.space16),
            child: SizedBox(
              width: double.infinity,
              height: AppSpacing.touchMin,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_rounded),
                label: Text('${AppLocalizations.of(context).general_add} ${AppLocalizations.of(context).checkout_address}'),
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
              onPressed: () => context.push(RoutePaths.checkoutDelivery),
              child: const Text('Continuer vers la livraison'),
            ),
          ),
        ),
      ),
    );
  }
}
