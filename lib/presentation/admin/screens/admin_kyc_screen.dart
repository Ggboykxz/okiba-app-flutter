import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class AdminKycScreen extends StatefulWidget {
  const AdminKycScreen({super.key});

  @override
  State<AdminKycScreen> createState() => _AdminKycScreenState();
}

class _AdminKycScreenState extends State<AdminKycScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.admin_kyc_title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.admin_kyc_pending),
            Tab(text: l10n.admin_kyc_approved),
            Tab(text: l10n.admin_kyc_rejected),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _pendingList(colorScheme, textTheme, l10n),
          _approvedList(colorScheme, textTheme),
          _rejectedList(colorScheme, textTheme),
        ],
      ),
    );
  }

  Widget _pendingList(ColorScheme colorScheme, TextTheme textTheme, AppLocalizations l10n) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.space16),
      children: [
        _kycCard('Marie O.', 'Vendeur', 'Soumis le 15 mai 2026', colorScheme, textTheme, l10n, pending: true),
        _kycCard('Paul D.', 'Livreur', 'Soumis le 14 mai 2026', colorScheme, textTheme, l10n, pending: true),
        _kycCard('Awa D.', 'Vendeur', 'Soumis le 13 mai 2026', colorScheme, textTheme, l10n, pending: true),
      ],
    );
  }

  Widget _approvedList(ColorScheme colorScheme, TextTheme textTheme) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.space16),
      children: [
        _kycCard('Adélaïde S.', 'Vendeur', 'Approuvé le 12 mai 2026', colorScheme, textTheme, null),
        _kycCard('Jean M.', 'Livreur', 'Approuvé le 10 mai 2026', colorScheme, textTheme, null),
      ],
    );
  }

  Widget _rejectedList(ColorScheme colorScheme, TextTheme textTheme) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.space16),
      children: [
        _kycCard('Pierre K.', 'Vendeur', 'Rejeté le 8 mai 2026', colorScheme, textTheme, null, rejected: true),
      ],
    );
  }

  Widget _kycCard(String name, String role, String date, ColorScheme colorScheme, TextTheme textTheme, AppLocalizations? l10n, {bool pending = false, bool rejected = false}) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space12),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: colorScheme.primaryContainer,
                  child: Text(name[0], style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimaryContainer)),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: textTheme.titleSmall),
                      Text(role, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                      Text(date, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
                if (pending && l10n != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                    ),
                    child: Text(l10n.admin_kyc_pending, style: const TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.w600)),
                  ),
              ],
            ),
            if (pending && l10n != null) ...[
              const SizedBox(height: AppSpacing.space16),
              Row(
                children: [
                  _docPreview(l10n.admin_kyc_selfie, colorScheme, textTheme),
                  const SizedBox(width: AppSpacing.space8),
                  _docPreview(l10n.admin_kyc_id_front, colorScheme, textTheme),
                  const SizedBox(width: AppSpacing.space8),
                  _docPreview(l10n.admin_kyc_id_back, colorScheme, textTheme),
                ],
              ),
              const SizedBox(height: AppSpacing.space16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.close_rounded, size: 18),
                      label: Text(l10n.admin_kyc_reject),
                      style: OutlinedButton.styleFrom(foregroundColor: colorScheme.error),
                      onPressed: () => _showRejectDialog(context, name),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: FilledButton.icon(
                      icon: const Icon(Icons.check_rounded, size: 18),
                      label: Text(l10n.admin_kyc_approve),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _docPreview(String label, ColorScheme colorScheme, TextTheme textTheme) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(AppSpacing.radius8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_rounded, color: colorScheme.onSurfaceVariant, size: 24),
              Text(label, style: TextStyle(fontSize: 9, color: colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    );
  }

  void _showRejectDialog(BuildContext context, String name) {
    final l10n = AppLocalizations.of(context)!;
    final reasonCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.admin_kyc_reject_title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Motif du rejet pour $name :'),
            const SizedBox(height: AppSpacing.space12),
            TextField(
              controller: reasonCtrl,
              decoration: const InputDecoration(hintText: 'Document illisible, photo manquante...'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.general_cancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(ctx).colorScheme.error),
            onPressed: () { Navigator.pop(ctx); },
            child: Text(l10n.admin_kyc_reject),
          ),
        ],
      ),
    );
  }
}
