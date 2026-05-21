import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class BoutiqueInventoryScreen extends StatefulWidget {
  const BoutiqueInventoryScreen({super.key});

  @override
  State<BoutiqueInventoryScreen> createState() => _BoutiqueInventoryScreenState();
}

class _BoutiqueInventoryScreenState extends State<BoutiqueInventoryScreen> {
  String _filter = 'Tous';

  final _filters = ['Tous', 'Stock bas', 'Rupture', 'Surnombre'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.boutique_inventory_title),
      ),
      body: Column(
        children: [
          // Summary
          Padding(
            padding: const EdgeInsets.all(AppSpacing.space16),
            child: Row(
              children: [
                Expanded(child: _summaryCard(l10n.boutique_inventory_total, '156', colorScheme.primary, colorScheme, textTheme)),
                const SizedBox(width: AppSpacing.space8),
                Expanded(child: _summaryCard(l10n.boutique_inventory_low, '12', colorScheme.error, colorScheme, textTheme)),
                const SizedBox(width: AppSpacing.space8),
                Expanded(child: _summaryCard(l10n.boutique_inventory_rupture, '3', Colors.orange, colorScheme, textTheme)),
              ],
            ),
          ),
          // Filters
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              children: _filters.map((f) {
                final selected = f == _filter;
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.space8),
                  child: FilterChip(
                    label: Text(f),
                    selected: selected,
                    onSelected: (_) => setState(() => _filter = f),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          // List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              children: [
                _inventoryItem('Chemise wax', '42', 'Sur 50', true, colorScheme, textTheme),
                _inventoryItem('Robe pagne', '18', 'Sur 30', true, colorScheme, textTheme),
                _inventoryItem('Sac artisanal', '0', 'Sur 20', false, colorScheme, textTheme),
                _inventoryItem('Boucles oreilles', '35', 'Sur 100', true, colorScheme, textTheme),
                _inventoryItem('Sandales cuir', '2', 'Sur 25', false, colorScheme, textTheme),
                _inventoryItem('Pagne wax', '8', 'Sur 15', true, colorScheme, textTheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(String label, String value, Color accent, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Text(value, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          Text(label, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _inventoryItem(
    String name, String stock, String max, bool isOk,
    ColorScheme colorScheme, TextTheme textTheme,
  ) {
    final isLow = int.tryParse(stock) != null && int.parse(stock) <= 5;
    final isOut = stock == '0';
    final statusColor = isOut ? Colors.orange : isLow ? colorScheme.error : colorScheme.primary;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space12),
        child: Row(
          children: [
            Container(
              width: 48, height: 48,
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radius8),
              ),
              child: Icon(Icons.inventory_2_rounded, color: statusColor),
            ),
            const SizedBox(width: AppSpacing.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text('$stock $max', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: AppSpacing.space8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                    child: LinearProgressIndicator(
                      value: int.tryParse(stock) != null && int.tryParse(max.split(' ')[1]) != null
                          ? int.parse(stock) / int.parse(max.split(' ')[1])
                          : 0,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.space8),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_rounded, size: 20),
                  onPressed: () => _showAdjustDialog(context, name),
                ),
                Text(isOut ? 'Rupture' : isLow ? 'Stock bas' : 'Ok',
                  style: textTheme.labelSmall?.copyWith(color: statusColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAdjustDialog(BuildContext context, String productName) {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${l10n.boutique_inventory_adjust} — $productName'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: l10n.boutique_inventory_new_stock,
            hintText: l10n.boutique_inventory_quantity,
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.general_cancel)),
          FilledButton(onPressed: () { Navigator.pop(ctx); }, child: Text(l10n.boutique_inventory_confirm)),
        ],
      ),
    );
  }
}
