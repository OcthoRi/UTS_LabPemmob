import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/page_container.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _mulaiKuis() {
    if (!_formKey.currentState!.validate()) return;

    // Sementara: navigasi ke halaman kuis dibuat di Tahap 6.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Halo, ${_nameController.text.trim()}!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: PageContainer(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: context.sp(0.45)),
              SizedBox(height: context.sp(0.05)),
              Text(
                'Kuis Pintar',
                style: TextStyle(
                  fontSize: context.sp(0.09),
                  fontWeight: FontWeight.w700,
                  color: cs.primary,
                ),
              ),
              SizedBox(height: context.sp(0.015)),
              Text(
                'Uji pengetahuan umummu!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: context.sp(0.04)),
              ),
              SizedBox(height: context.sp(0.08)),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _mulaiKuis(),
                style: TextStyle(fontSize: context.sp(0.045)),
                decoration: InputDecoration(
                  labelText: 'Nama kamu',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(context.sp(0.04)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: context.sp(0.06)),
              PrimaryButton(
                label: 'Mulai Kuis',
                icon: Icons.play_arrow,
                onPressed: _mulaiKuis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}