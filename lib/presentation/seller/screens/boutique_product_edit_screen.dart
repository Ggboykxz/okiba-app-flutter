import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class BoutiqueProductEditScreen extends StatefulWidget {
  final String productId;
  const BoutiqueProductEditScreen({super.key, required this.productId});

  @override
  State<BoutiqueProductEditScreen> createState() => _BoutiqueProductEditScreenState();
}

class _BoutiqueProductEditScreenState extends State<BoutiqueProductEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Chemise wax traditionnelle');
  final _descriptionController = TextEditingController(text: 'Magnifique chemise en wax fabriquée artisanalement.');
  final _priceController = TextEditingController(text: '15000');
  final _stockController = TextEditingController(text: '42');
  final _skuController = TextEditingController(text: 'CHM-001');
  final _weightController = TextEditingController(text: '0.3');
  bool _isActive = true;
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

  void _confirmDelete() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.boutiqueProductEditDeleteConfirm),
        content: Text(l10n.boutiqueProductEditDeleteIrreversible),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.generalCancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () { Navigator.pop(ctx); Navigator.pop(context); },
            child: Text(l10n.generalDelete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.boutiqueProductEditTitle),
        actions: [
          TextButton(
            onPressed: _formKey.currentState?.validate() == true ? () {} : null,
            child: Text(l10n.boutiqueProductEditSave),
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
                  ...List.generate(3, (i) => Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.space8),
                    child: Stack(
                      children: [
                        Container(
                          width: 100, height: 100,
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(AppSpacing.radius12),
                          ),
                          child: Icon(Icons.image_rounded, color: colorScheme.onSurfaceVariant),
                        ),
                        Positioned(
                          top: 4, right: 4,
                          child: Container(
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
                            child: IconButton(
                              icon: const Icon(Icons.close_rounded, size: 16, color: Colors.white),
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Container(
                    width: 100, height: 100,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                      border: Border.all(color: colorScheme.outlineVariant),
                    ),
                    child: Icon(Icons.add_rounded, color: colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space24),
            // Status toggle
            SwitchListTile(
              title: Text(l10n.boutiqueProductEditActive),
              subtitle: Text(_isActive ? l10n.boutiqueProductEditVisible : l10n.boutiqueProductEditHidden),
              value: _isActive,
              onChanged: (v) => setState(() => _isActive = v),
            ),
            const SizedBox(height: AppSpacing.space8),
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
            // Price & SKU
            Row(
              children: [
                Expanded(flex: 2,
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
            // Stock & Weight
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
            const SizedBox(height: AppSpacing.space32),
            // Delete
            Center(
              child: TextButton.icon(
                icon: const Icon(Icons.delete_outline_rounded),
                label: Text(l10n.boutiqueProductEditDelete),
                style: TextButton.styleFrom(foregroundColor: colorScheme.error),
                onPressed: _confirmDelete,
              ),
            ),
            const SizedBox(height: AppSpacing.space32),
          ],
        ),
      ),
    );
  }
}
