import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormatters {
  AppFormatters._();

  static final _numberFormat = NumberFormat('#,##0', 'fr');
  static final _dateFormat = DateFormat('d MMMM y', 'fr');
  static final _timeFormat = DateFormat('HH:mm', 'fr');
  static final _dateTimeFormat = DateFormat('d MMMM y à HH:mm', 'fr');

  static String currency(int amount) {
    return '${_numberFormat.format(amount)} FCFA';
  }

  static String formatPrice(num price) {
    return currency(price.toInt());
  }

  static String formatPriceCompact(num price) {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M FCFA';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(0)}k FCFA';
    }
    return '${price.toInt()} FCFA';
  }

  static String number(int value) => _numberFormat.format(value);

  static String date(DateTime date) => _dateFormat.format(date);
  static String time(DateTime date) => _timeFormat.format(date);
  static String dateTime(DateTime date) => _dateTimeFormat.format(date);

  static String phone(String phone) {
    final cleaned = phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.length == 11 && cleaned.startsWith('241')) {
      final d = cleaned.substring(3);
      return '+241 ${d.substring(0, 2)} ${d.substring(2, 4)} ${d.substring(4, 6)} ${d.substring(6)}';
    }
    if (cleaned.length == 9) {
      return '+241 ${cleaned.substring(0, 2)} ${cleaned.substring(2, 4)} ${cleaned.substring(4, 6)} ${cleaned.substring(6)}';
    }
    return phone;
  }

  static String distance(double km) {
    if (km < 1) return '${(km * 1000).toStringAsFixed(0)} m';
    return '${km.toStringAsFixed(1)} km';
  }

  static String rating(double rating) => rating.toStringAsFixed(1);
}

class PriceText extends StatelessWidget {
  final num price;
  final TextStyle? style;
  final bool isStrikethrough;

  const PriceText({
    super.key,
    required this.price,
    this.style,
    this.isStrikethrough = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = style ??
        theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w800,
          color: theme.colorScheme.onSurface,
        );

    return Text(
      AppFormatters.formatPrice(price),
      style: isStrikethrough
          ? textStyle?.copyWith(
              decoration: TextDecoration.lineThrough,
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            )
          : textStyle,
    );
  }
}
