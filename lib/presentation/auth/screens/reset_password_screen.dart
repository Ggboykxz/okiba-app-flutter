import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _phoneController = TextEditingController(text: '+241 ');
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onSend() {
    if (_formKey.currentState!.validate()) {
      context.push(RoutePaths.newPassword);
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
                  AppLocalizations.of(context)!.authForgotPasswordTitle,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.space8),
                Text(
                  AppLocalizations.of(context)!.authResetSubtitle,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.space32),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.authPhoneHint,
                    prefixIcon: const Icon(Icons.phone_rounded),
                  ),
                  validator: (v) {
                    if (v == null || v.length < 10) {
                      return AppLocalizations.of(context)!.authInvalidPhone;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.space8),
                Text(
                  AppLocalizations.of(context)!.authResetSmsInfo,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: AppSpacing.touchMin,
                  child: ElevatedButton(
                    onPressed: _onSend,
                    child: Text(AppLocalizations.of(context)!.authSend),
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
