import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OptionTile extends StatelessWidget {
  final String label; // huruf pilihan: A, B, C, D
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool revealed; // true setelah pengguna menjawab
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.revealed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    Color bg = cs.surfaceContainerHighest;
    Color border = Colors.transparent;
    IconData? icon;

    if (revealed && isCorrect) {
      bg = Colors.green.withValues(alpha: 0.25);
      border = Colors.green;
      icon = Icons.check_circle;
    } else if (revealed && isSelected) {
      bg = Colors.red.withValues(alpha: 0.25);
      border = Colors.red;
      icon = Icons.cancel;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: context.sp(0.03)),
      child: InkWell(
        borderRadius: BorderRadius.circular(context.sp(0.035)),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.all(context.sp(0.04)),
          decoration: BoxDecoration(
            color: bg,
            border: Border.all(color: border, width: 2),
            borderRadius: BorderRadius.circular(context.sp(0.035)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: context.sp(0.04),
                backgroundColor: cs.primary,
                child: Text(
                  label,
                  style: TextStyle(
                    color: cs.onPrimary,
                    fontSize: context.sp(0.035),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: context.sp(0.035)),
              Expanded(
                child: Text(text, style: TextStyle(fontSize: context.sp(0.04))),
              ),
              if (icon != null)
                Icon(icon, color: border, size: context.sp(0.06)),
            ],
          ),
        ),
      ),
    );
  }
}