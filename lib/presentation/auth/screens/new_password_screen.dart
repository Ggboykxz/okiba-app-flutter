import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  double get _strength {
    final p = _passwordController.text;
    double s = 0;
    if (p.length >= 8) s += 0.25;
    if (p.contains(RegExp(r'[A-Z]'))) s += 0.25;
    if (p.contains(RegExp(r'[a-z]'))) s += 0.25;
    if (p.contains(RegExp(r'[0-9]'))) s += 0.25;
    return s;
  }

  Color _strengthColor(double s) {
    if (s < 0.25) return Colors.transparent;
    if (s < 0.5) return AppColors.error;
    if (s < 0.75) return AppColors.warning;
    return AppColors.success;
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      context.go(RoutePaths.login);
    }
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.authNewPasswordTitle,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.space8),
                Text(
                  AppLocalizations.of(context)!.authNewPasswordSubtitle,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.space32),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.authNewPasswordHint,
                    prefixIcon: const Icon(Icons.lock_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                  validator: (v) {
                    if (v == null || v.length < 8) {
                      return AppLocalizations.of(context)!.authPasswordMinChars;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.space8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  child: LinearProgressIndicator(
                    value: _strength,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    color: _strengthColor(_strength),
                    minHeight: 4,
                  ),
                ),
                const SizedBox(height: AppSpacing.space16),
                TextFormField(
                  controller: _confirmController,
                  obscureText: _obscureConfirm,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.authConfirmPassword,
                    prefixIcon: const Icon(Icons.lock_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                      onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ),
                  validator: (v) {
                    if (v != _passwordController.text) {
                      return AppLocalizations.of(context)!.authPasswordsNoMatch;
                    }
                    return null;
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: AppSpacing.touchMin,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    child: Text(AppLocalizations.of(context)!.generalSave),
                  ),
                ),
                const SizedBox(height: AppSpacing.space8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
