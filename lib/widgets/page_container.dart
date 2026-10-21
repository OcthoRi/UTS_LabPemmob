import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Pembungkus halaman: bisa di-scroll (anti-overflow saat rotasi)
/// dan lebarnya dibatasi (rapi di tablet/web).
class PageContainer extends StatelessWidget {
  final Widget child;
  const PageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.sp(0.06)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.contentWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}