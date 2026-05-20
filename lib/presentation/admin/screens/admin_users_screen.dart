import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  String _roleFilter = 'Tous';
  final _roles = ['Tous', 'Client', 'Vendeur', 'Livreur'];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.admin_users_title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.space16, AppSpacing.space8, AppSpacing.space16, 0),
            child: Row(
              children: [
                Expanded(child: _chip(l10n.admin_users_total, '12 450', colorScheme.primary, colorScheme, textTheme)),
                const SizedBox(width: AppSpacing.space8),
                Expanded(child: _chip(l10n.admin_users_clients, '10 200', colorScheme.primary, colorScheme, textTheme)),
                const SizedBox(width: AppSpacing.space8),
                Expanded(child: _chip(l10n.admin_users_sellers, '1 850', colorScheme.secondary, colorScheme, textTheme)),
                const SizedBox(width: AppSpacing.space8),
                Expanded(child: _chip(l10n.admin_users_drivers, '400', colorScheme.tertiary, colorScheme, textTheme)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              children: _roles.map((r) {
                final selected = r == _roleFilter;
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.space8),
                  child: FilterChip(
                    label: Text(r),
                    selected: selected,
                    onSelected: (_) => setState(() => _roleFilter = r),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              children: [
                _userCard('Alice M.', 'alice@email.com', 'Client', l10n.admin_users_active, colorScheme, textTheme),
                _userCard('Adélaïde S.', 'adelaide@styles.ga', 'Vendeur', l10n.admin_users_active, colorScheme, textTheme),
                _userCard('Jean M.', 'jean@email.com', 'Livreur', l10n.admin_users_active, colorScheme, textTheme),
                _userCard('Pierre K.', 'pierre@email.com', 'Client', l10n.admin_users_suspended, colorScheme, textTheme),
                _userCard('Marie O.', 'marie@email.com', 'Vendeur', 'En attente KYC', colorScheme, textTheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, String count, Color color, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radius8),
      ),
      child: Column(
        children: [
          Text(count, style: textTheme.titleSmall?.copyWith(color: color, fontWeight: FontWeight.w700)),
          Text(label, style: TextStyle(color: color, fontSize: 9)),
        ],
      ),
    );
  }

  Widget _userCard(String name, String email, String role, String status, ColorScheme colorScheme, TextTheme textTheme) {
    final isSuspended = status == 'Suspendu';
    final isPending = status == 'En attente KYC';
    final statusColor = isSuspended ? colorScheme.error : isPending ? Colors.orange : Colors.green;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () => _showUserActions(context, name, status),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space12),
          child: Row(
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
                    Text(email, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                          ),
                          child: Text(role, style: TextStyle(fontSize: 10, color: colorScheme.onSurfaceVariant)),
                        ),
                        const SizedBox(width: AppSpacing.space8),
                        Container(
                          width: 6, height: 6,
                          decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 4),
                        Text(status, style: TextStyle(fontSize: 10, color: statusColor)),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      ),
    );
  }

  void _showUserActions(BuildContext context, String name, String currentStatus) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Text(name, style: Theme.of(ctx).textTheme.titleMedium), enabled: false),
            const Divider(),
            ListTile(leading: const Icon(Icons.visibility_rounded), title: Text(l10n.admin_users_view_profile), onTap: () => Navigator.pop(ctx)),
            if (currentStatus == l10n.admin_users_active)
              ListTile(leading: Icon(Icons.block_rounded, color: Colors.red), title: Text(l10n.admin_users_suspend, style: const TextStyle(color: Colors.red)), onTap: () => Navigator.pop(ctx)),
            if (currentStatus == l10n.admin_users_suspended)
              ListTile(leading: Icon(Icons.check_circle_rounded, color: Colors.green), title: Text(l10n.admin_users_reactivate, style: const TextStyle(color: Colors.green)), onTap: () => Navigator.pop(ctx)),
            if (currentStatus == 'En attente KYC')
              ListTile(leading: const Icon(Icons.verified_user_rounded), title: Text(l10n.admin_users_verify_kyc), onTap: () => Navigator.pop(ctx)),
            ListTile(leading: Icon(Icons.delete_rounded, color: Colors.red), title: Text(l10n.admin_users_delete_user, style: const TextStyle(color: Colors.red)), onTap: () => Navigator.pop(ctx)),
          ],
        ),
      ),
    );
  }
}
