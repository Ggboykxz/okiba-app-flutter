import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController(text: 'Alice Mbazoghe');
  final _bioController = TextEditingController(
    text: 'Passionnée de mode et de culture gabonaise.',
  );
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.profile_edit_title),
        actions: [
          TextButton(
            onPressed: _onSave,
            child: Text(l10n.general_save),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.space16),
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 56,
                    backgroundColor: colorScheme.primaryContainer,
                    child: Icon(
                      Icons.person_rounded,
                      size: 56,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 3,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        size: 18,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space32),
            TextFormField(
              controller: _nameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: l10n.profile_edit_name,
                prefixIcon: const Icon(Icons.person_rounded),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return l10n.profile_edit_name_required;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.space16),
            TextFormField(
              controller: _bioController,
              maxLines: 3,
              maxLength: 150,
              decoration: InputDecoration(
                labelText: l10n.profile_edit_bio,
                prefixIcon: const Icon(Icons.edit_rounded),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
            TextFormField(
              initialValue: '+241 62 00 00 01',
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: l10n.profile_edit_phone,
                prefixIcon: const Icon(Icons.phone_rounded),
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
            TextFormField(
              initialValue: 'alice@email.com',
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: l10n.profile_edit_email,
                prefixIcon: const Icon(Icons.email_rounded),
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
            SizedBox(
              width: double.infinity,
              height: AppSpacing.touchMin,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.location_on_rounded),
                label: Text(l10n.profile_edit_location),
              ),
            ),
            const SizedBox(height: AppSpacing.space32),
            SizedBox(
              width: double.infinity,
              height: AppSpacing.touchMin,
              child: ElevatedButton(
                onPressed: _onSave,
                child: Text(l10n.general_save),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
