import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class RapidPublishScreen extends StatefulWidget {
  const RapidPublishScreen({super.key});

  @override
  State<RapidPublishScreen> createState() => _RapidPublishScreenState();
}

class _RapidPublishScreenState extends State<RapidPublishScreen> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _onPublish() {
    if (_formKey.currentState!.validate()) {
      context.go(RoutePaths.rapidDashboard);
    }
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
        title: Text(l10n.sellerRapidPostAd),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.space16),
          children: [
            // Zone photo
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppSpacing.radius12),
                border: Border.all(
                  color: colorScheme.outline,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSpacing.radius12),
                  onTap: () {},
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo_rounded,
                          size: 48,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: AppSpacing.space8),
                        Text(
                          l10n.sellerRapidPhoto,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.space24),
            TextFormField(
              controller: _titleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: l10n.sellerRapidAdTitle,
                prefixIcon: const Icon(Icons.text_fields_rounded),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return l10n.sellerRapidAdTitleRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.space16),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: l10n.sellerRapidPrice,
                prefixIcon: const Icon(Icons.monetization_on_rounded),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return l10n.sellerRapidPriceRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.space16),
            TextFormField(
              controller: _descController,
              maxLines: 4,
              maxLength: 300,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: l10n.sellerRapidDescription,
                prefixIcon: const Icon(Icons.description_rounded),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
            // Catégorie
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: l10n.sellerRapidCategorySelect,
                prefixIcon: const Icon(Icons.category_rounded),
              ),
              items: const [
                DropdownMenuItem(value: 'mode', child: Text('Mode')),
                DropdownMenuItem(value: 'tech', child: Text('Tech')),
                DropdownMenuItem(
                  value: 'maison',
                  child: Text('Maison & Décoration'),
                ),
                DropdownMenuItem(value: 'service', child: Text('Services')),
                DropdownMenuItem(value: 'autre', child: Text('Autre')),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: AppSpacing.space16),
            // État
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: l10n.sellerRapidCondition,
                prefixIcon: const Icon(Icons.info_outline_rounded),
              ),
              items: const [
                DropdownMenuItem(value: 'neuf', child: Text('Neuf')),
                DropdownMenuItem(
                  value: 'tres_bon',
                  child: Text('Très bon état'),
                ),
                DropdownMenuItem(value: 'bon', child: Text('Bon état')),
                DropdownMenuItem(value: 'usage', child: Text('Usage normal')),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: AppSpacing.space32),
            SizedBox(
              width: double.infinity,
              height: AppSpacing.touchMin,
              child: ElevatedButton(
                onPressed: _onPublish,
                child: Text(l10n.sellerRapidPublish),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
