import 'package:ecommerce_app/core/theme/appbar_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ShopEassy",
    theme: AppTheme.lightTheme,

   )
  }

}



