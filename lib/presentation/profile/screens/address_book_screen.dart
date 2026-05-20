import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({super.key});

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  final _addresses = [
    _Address('Domicile', 'Libreville, Quartier Louis, Rue des Palmiers, Villa 45', true),
    _Address('Bureau', 'Libreville, Centre-ville, Immeuble OK, 3e étage', false),
    _Address('Maman', 'Libreville, Nzeng Ayong, Derrière l\'église', false),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_address_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          ..._addresses.asMap().entries.map((e) => Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.space8),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44, height: 44,
                    decoration: BoxDecoration(
                      color: e.value.isDefault ? colorScheme.primaryContainer : colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                    ),
                    child: Icon(
                      e.key == 0 ? Icons.home_rounded : e.key == 1 ? Icons.work_rounded : Icons.favorite_rounded,
                      color: e.value.isDefault ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(e.value.label, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                            if (e.value.isDefault) ...[
                              const SizedBox(width: AppSpacing.space8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: colorScheme.primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                                ),
                                child: Text(l10n.profile_address_default, style: textTheme.labelSmall?.copyWith(color: colorScheme.primary, fontSize: 9)),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(e.value.address, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        const SizedBox(height: AppSpacing.space8),
                        Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                              onPressed: () {},
                              child: Text(l10n.profile_address_edit, style: const TextStyle(fontSize: 12)),
                            ),
                            const SizedBox(width: AppSpacing.space16),
                            TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                              onPressed: () => _confirmDelete(context, e.value.label),
                              child: Text(l10n.profile_address_delete, style: TextStyle(fontSize: 12, color: colorScheme.error)),
                            ),
                            if (!e.value.isDefault) ...[
                              const SizedBox(width: AppSpacing.space16),
                              TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                                onPressed: () => setState(() {
                                  for (final a in _addresses) { a.isDefault = false; }
                                  _addresses[e.key].isDefault = true;
                                }),
                                child: Text(l10n.profile_address_set_default, style: TextStyle(fontSize: 12, color: colorScheme.primary)),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_rounded, size: 20),
                    onPressed: () => _showEditSheet(context, e.value),
                  ),
                ],
              ),
            ),
          )),
          const SizedBox(height: AppSpacing.space16),
          OutlinedButton.icon(
            icon: const Icon(Icons.add_rounded),
            label: Text(l10n.profile_address_add),
            onPressed: () => _showAddSheet(context),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  void _showEditSheet(BuildContext context, _Address address) {
    final l10n = AppLocalizations.of(context)!;
    final labelCtrl = TextEditingController(text: address.label);
    final addrCtrl = TextEditingController(text: address.address);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.space16, AppSpacing.space16, AppSpacing.space16,
          MediaQuery.of(ctx).viewInsets.bottom + AppSpacing.space16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.profile_address_edit_title, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.space16),
            TextField(controller: labelCtrl, decoration: const InputDecoration(labelText: 'Libellé (ex: Domicile)')),
            const SizedBox(height: AppSpacing.space12),
            TextField(controller: addrCtrl, decoration: InputDecoration(labelText: l10n.profile_address_full)),
            const SizedBox(height: AppSpacing.space24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () { Navigator.pop(ctx); },
                child: Text(l10n.profile_address_save),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }

  void _showAddSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labelCtrl = TextEditingController();
    final addrCtrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.space16, AppSpacing.space16, AppSpacing.space16,
          MediaQuery.of(ctx).viewInsets.bottom + AppSpacing.space16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.profile_address_new, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.space16),
            TextField(controller: labelCtrl, decoration: const InputDecoration(labelText: 'Libellé (ex: Domicile)')),
            const SizedBox(height: AppSpacing.space12),
            TextField(controller: addrCtrl, decoration: InputDecoration(labelText: l10n.profile_address_full)),
            const SizedBox(height: AppSpacing.space24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () { Navigator.pop(ctx); },
                child: Text(l10n.profile_address_add_action),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, String label) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.profile_address_delete_confirm),
        content: Text('Êtes-vous sûr de vouloir supprimer "$label" ?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.general_cancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(ctx).colorScheme.error),
            onPressed: () { Navigator.pop(ctx); },
            child: Text(l10n.general_delete),
          ),
        ],
      ),
    );
  }
}

class _Address {
  final String label;
  final String address;
  bool isDefault;
  _Address(this.label, this.address, this.isDefault);
}
