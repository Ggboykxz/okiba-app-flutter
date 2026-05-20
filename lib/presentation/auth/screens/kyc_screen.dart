import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  int _currentStep = 0;
  bool _selfieDone = false;
  bool _idFrontDone = false;
  bool _idBackDone = false;
  bool _isVerifying = false;
  bool _verified = false;

  static const _steps = [
    _KycStep(
      icon: Icons.face_rounded,
      label: 'Selfie',
    ),
    _KycStep(
      icon: Icons.badge_rounded,
      label: 'ID Recto',
    ),
    _KycStep(
      icon: Icons.badge_rounded,
      label: 'ID Verso',
    ),
  ];

  bool get _allDone => _selfieDone && _idFrontDone && _idBackDone;

  void _onCapture() {
    setState(() {
      if (_currentStep == 0) _selfieDone = true;
      if (_currentStep == 1) _idFrontDone = true;
      if (_currentStep == 2) _idBackDone = true;
      if (_currentStep < 2) _currentStep++;
    });
  }

  void _onVerify() {
    setState(() => _isVerifying = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isVerifying = false;
          _verified = true;
        });
        Future.delayed(const Duration(milliseconds: 600), () {
          if (mounted) {
            context.go(RoutePaths.profileSetup);
          }
        });
      }
    });
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.kycTitle,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.space8),
              Text(
                AppLocalizations.of(context)!.kycSubtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.space32),
              // Step indicator
              Row(
                children: List.generate(_steps.length, (i) {
                  final step = _steps[i];
                  final isActive = i == _currentStep;
                  final isDone = (i == 0 && _selfieDone) ||
                      (i == 1 && _idFrontDone) ||
                      (i == 2 && _idBackDone);
                  return Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: isDone
                                ? colorScheme.primary
                                : isActive
                                    ? colorScheme.primaryContainer
                                    : colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isDone ? Icons.check_rounded : step.icon,
                            size: 24,
                            color: isDone
                                ? colorScheme.onPrimary
                                : isActive
                                    ? colorScheme.onPrimaryContainer
                                    : colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.space4),
                        Text(
                          step.label,
                          style: textTheme.labelSmall?.copyWith(
                            color: isActive
                                ? colorScheme.primary
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: AppSpacing.space32),
              // Camera preview area
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSpacing.radius16),
                  ),
                  child: _verified
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              size: 80,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(height: AppSpacing.space16),
                            Text(
                              AppLocalizations.of(context)!.kycVerified,
                              style: textTheme.titleLarge?.copyWith(
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.space8),
                            Text(
                              AppLocalizations.of(context)!.kycRedirecting,
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        )
                      : _isVerifying
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 64,
                                  height: 64,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.space24),
                                Text(
                                  AppLocalizations.of(context)!.kycVerifying,
                                  style: textTheme.titleMedium,
                                ),
                                const SizedBox(height: AppSpacing.space8),
                                Text(
                                  AppLocalizations.of(context)!.kycAnalyzing,
                                  textAlign: TextAlign.center,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _getStepIcon(),
                                  size: 72,
                                  color: colorScheme.onSurfaceVariant
                                      .withValues(alpha: 0.4),
                                ),
                                const SizedBox(height: AppSpacing.space24),
                                Text(
                                  _getStepTitle(context),
                                  style: textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: AppSpacing.space8),
                                Text(
                                  _getStepSubtitle(context),
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: AppSpacing.space24),
                                ElevatedButton.icon(
                                  onPressed: _onCapture,
                                  icon: const Icon(
                                      Icons.camera_alt_rounded),
                                  label: Text(
                                    _currentStep == 0
                                        ? AppLocalizations.of(context)!.kycSelfie
                                        : AppLocalizations.of(context)!.kycTakePhoto,
                                  ),
                                ),
                              ],
                            ),
                ),
              ),
              const SizedBox(height: AppSpacing.space24),
              // Capture status
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _CaptureStatus(
                    label: AppLocalizations.of(context)!.kycStepSelfieLabel,
                    done: _selfieDone,
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  _CaptureStatus(
                    label: AppLocalizations.of(context)!.kycStepIdFrontLabel,
                    done: _idFrontDone,
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  _CaptureStatus(
                    label: AppLocalizations.of(context)!.kycStepIdBackLabel,
                    done: _idBackDone,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space24),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton(
                  onPressed: _allDone && !_isVerifying ? _onVerify : null,
                  child: Text(AppLocalizations.of(context)!.kycVerifyIdentity),
                ),
              ),
              const SizedBox(height: AppSpacing.space8),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getStepIcon() {
    switch (_currentStep) {
      case 0:
        return Icons.face_rounded;
      case 1:
        return Icons.badge_rounded;
      case 2:
        return Icons.badge_rounded;
      default:
        return Icons.camera_alt_rounded;
    }
  }

  String _getStepTitle(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    switch (_currentStep) {
      case 0:
        return l.kycStepSelfieTitle;
      case 1:
        return l.kycStepIdFrontTitle;
      case 2:
        return l.kycStepIdBackTitle;
      default:
        return '';
    }
  }

  String _getStepSubtitle(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    switch (_currentStep) {
      case 0:
        return l.kycStepSelfieDesc;
      case 1:
        return l.kycStepIdFrontDesc;
      case 2:
        return l.kycStepIdBackDesc;
      default:
        return '';
    }
  }
}

class _KycStep {
  final IconData icon;
  final String label;
  const _KycStep({
    required this.icon,
    required this.label,
  });
}

class _CaptureStatus extends StatelessWidget {
  final String label;
  final bool done;

  const _CaptureStatus({
    required this.label,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          done ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
          size: 18,
          color: done ? colorScheme.primary : colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: AppSpacing.space4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: done
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
