import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class BoutiqueProductCreateScreen extends StatefulWidget {
  const BoutiqueProductCreateScreen({super.key});

  @override
  State<BoutiqueProductCreateScreen> createState() => _BoutiqueProductCreateScreenState();
}

class _BoutiqueProductCreateScreenState extends State<BoutiqueProductCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _skuController = TextEditingController();
  final _weightController = TextEditingController();
  final _photos = <int>[1, 2, 3];
  bool _hasVariants = false;
  String _category = 'Mode';

  final _categories = ['Mode', 'Électronique', 'Maison', 'Beauté', 'Alimentation', 'Sport'];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _skuController.dispose();
    _weightController.dispose();
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
        title: Text(l10n.boutiqueProductCreateTitle),
        actions: [
          TextButton(
            onPressed: _formKey.currentState?.validate() == true ? () {} : null,
            child: Text(l10n.boutiqueProductCreatePublish),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.space16),
          children: [
            // Photos
            Text(l10n.boutiqueProductCreatePhotos, style: textTheme.titleMedium),
            const SizedBox(height: AppSpacing.space12),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  ..._photos.map((p) => Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.space8),
                    child: Container(
                      width: 100, height: 100,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(AppSpacing.radius12),
                        border: Border.all(color: colorScheme.outlineVariant),
                      ),
                      child: const Icon(Icons.add_photo_alternate_rounded, size: 32),
                    ),
                  )),
                  Container(
                    width: 100, height: 100,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                      border: Border.all(color: colorScheme.outlineVariant, style: BorderStyle.solid),
                    ),
                    child: Icon(Icons.add_rounded, color: colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space24),
            // Name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: l10n.boutiqueProductCreateName),
              validator: (v) => (v == null || v.isEmpty) ? l10n.boutiqueProductCreateNameRequired : null,
            ),
            const SizedBox(height: AppSpacing.space16),
            // Category
            DropdownButtonFormField<String>(
              initialValue: _category,
              decoration: InputDecoration(labelText: l10n.boutiqueProductCreateCategory),
              items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _category = v!),
            ),
            const SizedBox(height: AppSpacing.space16),
            // Price & SKU row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(labelText: l10n.boutiqueProductCreatePrice),
                    keyboardType: TextInputType.number,
                    validator: (v) => (v == null || v.isEmpty) ? l10n.boutiqueProductCreateNameRequired : null,
                  ),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: TextFormField(
                    controller: _skuController,
                    decoration: InputDecoration(labelText: l10n.boutiqueProductCreateSku),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space16),
            // Stock & Weight row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _stockController,
                    decoration: InputDecoration(labelText: l10n.boutiqueProductCreateStock),
                    keyboardType: TextInputType.number,
                    validator: (v) => (v == null || v.isEmpty) ? l10n.boutiqueProductCreateNameRequired : null,
                  ),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: TextFormField(
                    controller: _weightController,
                    decoration: InputDecoration(labelText: l10n.boutiqueProductCreateWeight),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space16),
            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: l10n.boutiqueProductCreateDescription, alignLabelWithHint: true),
              maxLines: 4,
            ),
            const SizedBox(height: AppSpacing.space24),
            // Variants toggle
            SwitchListTile(
              title: Text(l10n.boutiqueProductCreateVariants),
              subtitle: Text(l10n.boutiqueProductCreateVariantsHint),
              value: _hasVariants,
              onChanged: (v) => setState(() => _hasVariants = v),
            ),
            if (_hasVariants) ...[
              const SizedBox(height: AppSpacing.space16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.space16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Variantes', style: textTheme.titleSmall),
                          TextButton.icon(
                            icon: const Icon(Icons.add_rounded, size: 18),
                            label: Text(l10n.boutiqueProductCreateVariantsAdd),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Divider(),
                      _variantRow('Taille M', '3 500 FCFA', '15', colorScheme, textTheme, l10n),
                      _variantRow('Taille L', '3 500 FCFA', '12', colorScheme, textTheme, l10n),
                      _variantRow('Taille XL', '4 000 FCFA', '8', colorScheme, textTheme, l10n),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.space32),
          ],
        ),
      ),
    );
  }

  Widget _variantRow(String name, String price, String stock, ColorScheme colorScheme, TextTheme textTheme, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.space4),
      child: Row(
        children: [
          Expanded(child: Text(name, style: textTheme.bodyMedium)),
          Text(price, style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(width: AppSpacing.space16),
          Text('${l10n.boutiqueProductCreateVariantsStock} $stock', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
          IconButton(icon: const Icon(Icons.delete_outline_rounded, size: 20), onPressed: () {}),
        ],
      ),
    );
  }
}
