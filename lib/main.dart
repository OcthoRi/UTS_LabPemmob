import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

void main() => runApp(const KuisApp());

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Flutter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/logo.png', width: context.sp(0.4)),
              SizedBox(height: context.sp(0.05)),
              Text('Welcome',
                  style: TextStyle(
                      fontSize: context.sp(0.06),
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}