import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/dummy_data.dart';
import '../profile/addresses_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final quantities = [1, 1];

  @override
  Widget build(BuildContext context) {
    final products = DummyData.products.take(2).toList();

    double subtotal = 0;

    for (int i = 0; i < products.length; i++) {
      subtotal += products[i].price * quantities[i];
    }

    const delivery = 50.0;
    const discount = 500.0;

    final total = subtotal + delivery - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product.image,
                          height: 85,
                          width: 85,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 7),

                            Text(
                              '₹${product.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 7),

                            Row(
                              children: [
                                _SmallButton(
                                  icon: Icons.remove,
                                  onTap: () {
                                    if (quantities[index] > 1) {
                                      setState(() {
                                        quantities[index]--;
                                      });
                                    }
                                  },
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Text('${quantities[index]}'),
                                ),

                                _SmallButton(
                                  icon: Icons.add,
                                  onTap: () {
                                    setState(() {
                                      quantities[index]++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              children: [
                _PriceRow(
                  title: 'Subtotal',
                  value: '₹${subtotal.toStringAsFixed(0)}',
                ),

                _PriceRow(
                  title: 'Delivery',
                  value: '₹${delivery.toStringAsFixed(0)}',
                ),

                _PriceRow(
                  title: 'Discount',
                  value: '-₹${discount.toStringAsFixed(0)}',
                ),

                const Divider(),

                _PriceRow(
                  title: 'Total',
                  value: '₹${total.toStringAsFixed(0)}',
                  bold: true,
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddressesScreen(),
                      ),
                    );
                  },
                  child: const Text('Checkout →'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String title;
  final String value;
  final bool bold;

  const _PriceRow({
    required this.title,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : null,
              fontSize: bold ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SmallButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
