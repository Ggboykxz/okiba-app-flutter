import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import 'category_chip.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radius16),
        ),
      ),
      builder: (_) => const FilterBottomSheet(),
    );
  }
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _priceRange = const RangeValues(0, 500000);
  int _selectedSort = 0;
  final Set<String> _selectedCategories = {};

  static const _categories = [
    ('mode', Icons.checkroom_rounded, 'Mode'),
    ('alimentation', Icons.restaurant_rounded, 'Alimentation'),
    ('tech', Icons.devices_rounded, 'Tech'),
    ('maison', Icons.chair_rounded, 'Maison'),
    ('service', Icons.handyman_rounded, 'Services'),
  ];

  static const _sortOptions = [
    'Pertinence',
    'Prix croissant',
    'Prix décroissant',
    'Nouveautés',
    'Meilleures ventes',
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(AppSpacing.space24),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filtres',
                    style: textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () => setState(() {
                      _priceRange = const RangeValues(0, 500000);
                      _selectedSort = 0;
                      _selectedCategories.clear();
                    }),
                    child: const Text('Réinitialiser'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space24),
              Text('Catégories', style: textTheme.titleSmall),
              const SizedBox(height: AppSpacing.space12),
              Wrap(
                spacing: AppSpacing.space8,
                runSpacing: AppSpacing.space8,
                children: _categories.map((c) {
                  final selected = _selectedCategories.contains(c.$1);
                  return CategoryChip(
                    icon: c.$2,
                    label: c.$3,
                    isSelected: selected,
                    onTap: () => setState(() {
                      if (selected) {
                        _selectedCategories.remove(c.$1);
                      } else {
                        _selectedCategories.add(c.$1);
                      }
                    }),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSpacing.space24),
              Text('Prix maximum', style: textTheme.titleSmall),
              const SizedBox(height: AppSpacing.space12),
              RangeSlider(
                values: _priceRange,
                min: 0,
                max: 500000,
                divisions: 20,
                labels: RangeLabels(
                  '${_priceRange.start.toInt()} FCFA',
                  '${_priceRange.end.toInt()} FCFA',
                ),
                onChanged: (v) => setState(() => _priceRange = v),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_priceRange.start.toInt()} FCFA',
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    '${_priceRange.end.toInt()} FCFA',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space24),
              Text('Trier par', style: textTheme.titleSmall),
              const SizedBox(height: AppSpacing.space12),
              ...List.generate(_sortOptions.length, (i) {
                return ListTile(
                  leading: Icon(
                    _selectedSort == i
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_off_rounded,
                    color: _selectedSort == i
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                  ),
                  title: Text(_sortOptions[i]),
                  onTap: () => setState(() => _selectedSort = i),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                );
              }),
              const SizedBox(height: AppSpacing.space24),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Appliquer'),
                ),
              ),
              const SizedBox(height: AppSpacing.space8),
            ],
          ),
        );
      },
    );
  }
}
