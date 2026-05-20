import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';
import '../widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    const subtotal = 75500;
    const delivery = 2000;
    const total = subtotal + delivery;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.cart_title),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.cart_clear),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 180),
        children: [
          CartItemCard(
            title: 'Chemise traditionnelle',
            price: '15 000 FCFA',
            quantity: 2,
            onTap: () => context.push(
              RoutePaths.cartItemEdit.replaceAll(':id', 'item_1'),
            ),
          ),
          CartItemCard(
            title: 'Poulet braisé',
            price: '5 500 FCFA',
            quantity: 1,
            onTap: () => context.push(
              RoutePaths.cartItemEdit.replaceAll(':id', 'item_2'),
            ),
          ),
          CartItemCard(
            title: 'Smartphone reconditionné',
            price: '85 000 FCFA',
            quantity: 1,
            onTap: () => context.push(
              RoutePaths.cartItemEdit.replaceAll(':id', 'item_3'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.space16,
          AppSpacing.space16,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sous-total',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${subtotal}FCFA',
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                      AppLocalizations.of(context)!.checkout_review_delivery,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  Text(
                    '${delivery}FCFA',
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
              const Divider(height: AppSpacing.space24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                      AppLocalizations.of(context)!.cart_total,
                      style: textTheme.titleLarge,
                    ),
                  Text(
                    '${total}FCFA',
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space16),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton(
                  onPressed: () => context.push(RoutePaths.checkoutAddress),
                  child: Text(AppLocalizations.of(context)!.cart_checkout),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
