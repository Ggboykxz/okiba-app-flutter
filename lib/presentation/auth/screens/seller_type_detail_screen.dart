import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class SellerTypeDetailScreen extends StatefulWidget {
  const SellerTypeDetailScreen({super.key});

  @override
  State<SellerTypeDetailScreen> createState() => _SellerTypeDetailScreenState();
}

class _SellerTypeDetailScreenState extends State<SellerTypeDetailScreen> {
  int? _selectedType;

  static const _types = [
    _SellerType(
      icon: Icons.chat_rounded,
      title: 'WhatsApp',
      badge: 'Recommandé',
      description:
          'Vendez simplement en partageant vos produits\nsur vos groupes WhatsApp.',
      features: [
        'Pas de boutique à gérer',
        'Partage par lien WhatsApp',
        'Commandes par message',
        'Idéal pour débuter',
      ],
      color: Color(0xFF25D366),
    ),
    _SellerType(
      icon: Icons.store_rounded,
      title: 'Boutique',
      badge: null,
      description:
          'Créez votre vitrine complète avec catalogue,\nstock et statistiques.',
      features: [
        'Catalogue complet',
        'Gestion de stock',
        'Variants produits',
        'Analytics avancés',
      ],
      color: Color(0xFF1B5E3F),
    ),
    _SellerType(
      icon: Icons.flash_on_rounded,
      title: 'Rapide',
      badge: null,
      description:
          'Vendez vos articles d\'occasion en quelques\ntouches. Style Vinted.',
      features: [
        'Publication en 30s',
        'Photos + description',
        'Prix suggéré',
        'Idéal pour vide-dressing',
      ],
      color: Color(0xFFE8913A),
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
                AppLocalizations.of(context)!.sellerTypeTitle,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.space8),
              Text(
                AppLocalizations.of(context)!.sellerTypeSubtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.space24),
              Expanded(
                child: ListView.separated(
                  itemCount: _types.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.space16),
                  itemBuilder: (_, i) {
                    final type = _types[i];
                    final selected = _selectedType == i;
                    return _SellerTypeCard(
                      type: type,
                      selected: selected,
                      onTap: () => setState(() => _selectedType = i),
                    );
                  },
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton(
                  onPressed: _selectedType != null
                      ? () => context.go(RoutePaths.kyc)
                      : null,
                  child: Text(AppLocalizations.of(context)!.authContinue),
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

class _SellerTypeCard extends StatelessWidget {
  final _SellerType type;
  final bool selected;
  final VoidCallback onTap;

  const _SellerTypeCard({
    required this.type,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: selected ? colorScheme.primaryContainer : colorScheme.surface,
      borderRadius: BorderRadius.circular(AppSpacing.radius16),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.space20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radius16),
            border: Border.all(
              color: selected ? colorScheme.primary : colorScheme.outline,
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: type.color.withValues(alpha: 0.15),
                      borderRadius:
                          BorderRadius.circular(AppSpacing.radius12),
                    ),
                    child: Icon(type.icon, color: type.color, size: 28),
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(type.title,
                            style: textTheme.titleLarge?.copyWith(
                              color: selected
                                  ? colorScheme.onPrimaryContainer
                                  : colorScheme.onSurface,
                            )),
                        if (type.badge != null) ...[
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: type.color.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(
                                  AppSpacing.radiusFull),
                            ),
                            child: Text(
                              type.badge!,
                              style: textTheme.labelSmall?.copyWith(
                                color: type.color,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
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
              const SizedBox(height: AppSpacing.space12),
              Text(
                type.description,
                style: textTheme.bodyMedium?.copyWith(
                  color: selected
                      ? colorScheme.onPrimaryContainer.withValues(alpha: 0.7)
                      : colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.space12),
              ...type.features.map((f) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_rounded,
                          size: 16,
                          color: selected
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.primary,
                        ),
                        const SizedBox(width: AppSpacing.space8),
                        Text(
                          f,
                          style: textTheme.bodySmall?.copyWith(
                            color: selected
                                ? colorScheme.onPrimaryContainer
                                    .withValues(alpha: 0.7)
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _SellerType {
  final IconData icon;
  final String title;
  final String? badge;
  final String description;
  final List<String> features;
  final Color color;

  const _SellerType({
    required this.icon,
    required this.title,
    this.badge,
    required this.description,
    required this.features,
    required this.color,
  });
}
