import 'package:ecommerce_app/core/theme/appbar_theme.dart';
import 'package:ecommerce_app/features/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: EcommerceApp()));
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopEassy",
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
