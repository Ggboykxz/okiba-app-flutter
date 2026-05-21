import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';

class WhatsAppProductCreateScreen extends StatefulWidget {
  const WhatsAppProductCreateScreen({super.key});

  @override
  State<WhatsAppProductCreateScreen> createState() => _WhatsAppProductCreateScreenState();
}

class _WhatsAppProductCreateScreenState extends State<WhatsAppProductCreateScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<int> _selectedPhotos = [];

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _onSave() {
    final l10n = AppLocalizations.of(context);
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.seller_whatsapp_created)),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.seller_whatsapp_product_create),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.space16),
          children: [
            // Photos
            Text(l10n.seller_whatsapp_photos, style: textTheme.titleSmall),
            const SizedBox(height: AppSpacing.space8),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(_selectedPhotos.length, (i) {
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
                          Center(
                            child: Icon(Icons.image_rounded, color: colorScheme.onSurfaceVariant),
                          ),
                          Positioned(
                            top: 4, right: 4,
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedPhotos.removeAt(i)),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: colorScheme.error,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.close_rounded, size: 14, color: colorScheme.onError),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  if (_selectedPhotos.length < 5)
                    GestureDetector(
                      onTap: () => setState(() => _selectedPhotos.add(_selectedPhotos.length)),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(AppSpacing.radius12),
                          border: Border.all(color: colorScheme.outlineVariant, style: BorderStyle.solid),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_photo_alternate_rounded, color: colorScheme.primary),
                            const SizedBox(height: 4),
                            Text(l10n.general_add, style: textTheme.bodySmall?.copyWith(color: colorScheme.primary)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space24),
            // Name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: l10n.boutique_product_create_name,
                prefixIcon: const Icon(Icons.shopping_bag_rounded),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? l10n.seller_whatsapp_name_required : null,
            ),
            const SizedBox(height: AppSpacing.space16),
            // Price
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: l10n.boutique_product_create_price,
                prefixIcon: const Icon(Icons.monetization_on_rounded),
                prefixText: '${l10n.currency_fcfa} ',
              ),
              validator: (v) => v == null || v.trim().isEmpty ? l10n.seller_whatsapp_price_required : null,
            ),
            const SizedBox(height: AppSpacing.space16),
            // Description
            TextFormField(
              controller: _descController,
              maxLines: 4,
              maxLength: 300,
              decoration: InputDecoration(
                labelText: l10n.boutique_product_create_description,
                prefixIcon: const Icon(Icons.description_rounded),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: AppSpacing.space32),
            SizedBox(
              width: double.infinity,
              height: AppSpacing.touchMin,
              child: ElevatedButton(
                onPressed: _onSave,
                child: Text(l10n.seller_rapid_publish),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
