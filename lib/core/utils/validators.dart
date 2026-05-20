class AppValidators {
  AppValidators._();

  static String? required(String? value, [String field = 'Ce champ']) {
    if (value == null || value.trim().isEmpty) {
      return '$field est requis';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le numéro de téléphone est requis';
    }
    final cleaned = value.replaceAll(RegExp(r'\s+'), '');
    if (cleaned.startsWith('+241')) {
      if (cleaned.length != 13) {
        return 'Format: +241 XX XX XX XX';
      }
    } else if (cleaned.length != 9) {
      return 'Le numéro doit faire 9 chiffres';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Email invalide';
    }
    return null;
  }

  static String? price(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le prix est requis';
    }
    final parsed = int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), ''));
    if (parsed == null || parsed <= 0) {
      return 'Le prix doit être un nombre positif';
    }
    if (parsed > 100000000) {
      return 'Prix maximum: 100 000 000 FCFA';
    }
    return null;
  }

  static String? minLength(String? value, int min, [String field = 'Ce champ']) {
    if (value == null || value.trim().length < min) {
      return '$field doit contenir au moins $min caractères';
    }
    return null;
  }

  static String? maxLength(String? value, int max, [String field = 'Ce champ']) {
    if (value != null && value.length > max) {
      return '$field doit contenir au maximum $max caractères';
    }
    return null;
  }
}
