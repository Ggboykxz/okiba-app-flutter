import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  int? _selectedRole;

  static const _roles = [
    _RoleCard(
      icon: Icons.shopping_bag_rounded,
      title: 'Client',
      subtitle: 'Achetez des produits\nauprès des vendeurs locaux',
    ),
    _RoleCard(
      icon: Icons.store_rounded,
      title: 'Vendeur',
      subtitle: 'Vendez vos produits\net gérez votre boutique',
    ),
    _RoleCard(
      icon: Icons.delivery_dining_rounded,
      title: 'Livreur',
      subtitle: 'Livrez des commandes\net gagnez de l\'argent',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).role_question,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.space8),
              Text(
                AppLocalizations.of(context).role_subtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.space32),
              ...List.generate(_roles.length, (i) {
                final role = _roles[i];
                final selected = _selectedRole == i;
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.space16),
                  child: Material(
                    color: selected
                        ? colorScheme.primaryContainer
                        : colorScheme.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radius16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(AppSpacing.radius16),
                      onTap: () => setState(() => _selectedRole = i),
                      child: Container(
                        height: AppSpacing.touchMin + 16,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.space20,
                          vertical: AppSpacing.space16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radius16),
                          border: Border.all(
                            color: selected
                                ? colorScheme.primary
                                : colorScheme.outline,
                            width: selected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              role.icon,
                              size: AppSpacing.iconSizeLarge,
                              color: selected
                                  ? colorScheme.onPrimaryContainer
                                  : colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: AppSpacing.space16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    role.title,
                                    style: textTheme.titleMedium?.copyWith(
                                      color: selected
                                          ? colorScheme.onPrimaryContainer
                                          : colorScheme.onSurface,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    role.subtitle,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: selected
                                          ? colorScheme.onPrimaryContainer
                                              .withValues(alpha: 0.7)
                                          : colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              selected
                                  ? Icons.radio_button_checked_rounded
                                  : Icons.radio_button_off_rounded,
                              color: selected
                                  ? colorScheme.primary
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton(
                  onPressed: _selectedRole != null
                      ? () {
                          switch (_selectedRole!) {
                            case 0:
                              context.go(RoutePaths.profileSetup);
                            case 1:
                              context.go(RoutePaths.sellerTypeDetail);
                            case 2:
                              context.go(RoutePaths.kyc);
                          }
                        }
                      : null,
                  child: Text(AppLocalizations.of(context).auth_continue),
                ),
              ),
              const SizedBox(height: AppSpacing.space8),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard {
  final IconData icon;
  final String title;
  final String subtitle;
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}
