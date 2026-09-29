import 'package:flutter/material.dart';

import '../../../../models/dummy_data.dart';
import '../../../../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Products')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: DummyData.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.67,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: DummyData.products[index]);
        },
      ),
    );
  }
}
