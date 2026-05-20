import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';

class WhatsAppProductEditScreen extends StatefulWidget {
  final String productId;

  const WhatsAppProductEditScreen({super.key, required this.productId});

  @override
  State<WhatsAppProductEditScreen> createState() => _WhatsAppProductEditScreenState();
}

class _WhatsAppProductEditScreenState extends State<WhatsAppProductEditScreen> {
  final _nameController = TextEditingController(text: 'Chemise traditionnelle');
  final _priceController = TextEditingController(text: '15000');
  final _descController = TextEditingController(
    text: 'Chemise traditionnelle gabonaise en pagne wax.',
  );
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.sellerWhatsappProductEdit),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline_rounded, color: colorScheme.error),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(l10n.sellerWhatsappDeleteConfirm),
                  content: Text(l10n.sellerWhatsappDeleteIrreversible),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.generalCancel)),
                    TextButton(
                      onPressed: () { Navigator.pop(ctx); context.pop(); },
                      child: Text(l10n.generalDelete, style: TextStyle(color: colorScheme.error)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.space16),
          children: [
            // Photos
            Text(l10n.boutiqueProductCreatePhotos, style: textTheme.titleSmall),
            const SizedBox(height: AppSpacing.space8),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(3, (i) {
                  return Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(right: AppSpacing.space8),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                    ),
                    child: Stack(
                      children: [
                        Center(child: Icon(Icons.image_rounded, color: colorScheme.onSurfaceVariant)),
                        Positioned(
                          top: 4, right: 4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: colorScheme.error, shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.close_rounded, size: 14, color: colorScheme.onError),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: AppSpacing.space24),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: l10n.boutiqueProductCreateName, prefixIcon: const Icon(Icons.shopping_bag_rounded)),
              validator: (v) => v == null || v.trim().isEmpty ? l10n.sellerWhatsappNameRequired : null,
            ),
            const SizedBox(height: AppSpacing.space16),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: l10n.boutiqueProductCreatePrice, prefixIcon: const Icon(Icons.monetization_on_rounded)),
              validator: (v) => v == null || v.trim().isEmpty ? l10n.sellerWhatsappPriceRequired : null,
            ),
            const SizedBox(height: AppSpacing.space16),
            TextFormField(
              controller: _descController,
              maxLines: 4,
              maxLength: 300,
              decoration: InputDecoration(
                labelText: l10n.boutiqueProductCreateDescription, prefixIcon: const Icon(Icons.description_rounded), alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: AppSpacing.space32),
            SizedBox(
              width: double.infinity, height: AppSpacing.touchMin,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.sellerWhatsappUpdated)),
                    );
                    context.pop();
                  }
                },
                child: Text(l10n.boutiqueProductEditSave),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
