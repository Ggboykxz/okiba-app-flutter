import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class CartItemEditScreen extends StatefulWidget {
  final String itemId;

  const CartItemEditScreen({super.key, required this.itemId});

  @override
  State<CartItemEditScreen> createState() => _CartItemEditScreenState();
}

class _CartItemEditScreenState extends State<CartItemEditScreen> {
  int _quantity = 2;
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
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
        title: Text(AppLocalizations.of(context)!.cart_item_edit_title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline_rounded, color: colorScheme.error),
            onPressed: () {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Article retiré du panier'),
                  action: SnackBarAction(label: AppLocalizations.of(context)!.general_cancel, onPressed: () {}),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product info
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                    ),
                    child: Icon(Icons.image_rounded, color: colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chemise traditionnelle', style: textTheme.titleMedium),
                        const SizedBox(height: 4),
                        Text('15 000 FCFA', style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space32),
              // Quantity
              Text(AppLocalizations.of(context)!.cart_item_quantity, style: textTheme.titleSmall),
              const SizedBox(height: AppSpacing.space12),
              Row(
                children: [
                  IconButton.filled(
                    onPressed: _quantity > 1
                        ? () => setState(() => _quantity--)
                        : null,
                    icon: const Icon(Icons.remove_rounded),
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  Text(
                    '$_quantity',
                    style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  IconButton.filled(
                    onPressed: _quantity < 99
                        ? () => setState(() => _quantity++)
                        : null,
                    icon: const Icon(Icons.add_rounded),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space32),
              // Note
              Text('${AppLocalizations.of(context)!.cart_item_note} (optionnelle)', style: textTheme.titleSmall),
              const SizedBox(height: AppSpacing.space12),
              TextField(
                controller: _noteController,
                maxLines: 3,
                maxLength: 200,
                decoration: const InputDecoration(
                  hintText: 'Ex : Taille M, couleur bleu...',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: AppSpacing.space32),
              // Price recap
              Container(
                padding: const EdgeInsets.all(AppSpacing.space16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSpacing.radius12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.cart_total, style: textTheme.titleMedium),
                    Text(
                      '${_quantity * 15000} FCFA',
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton(
                  onPressed: () => context.pop(),
                  child: Text(AppLocalizations.of(context)!.general_save),
                ),
              ),
              const SizedBox(height: AppSpacing.space8),
            ],
          ),
        ),
      ),
    );
  }
}
