import 'package:flutter/material.dart';

import 'order_details_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _OrderCard(
            orderId: 'ORD10245',
            date: '18 Sep 2026',
            product: 'Wireless Headphones',
            amount: '₹2,499',
            status: 'Shipped',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderDetailsScreen()),
              );
            },
          ),

          _OrderCard(
            orderId: 'ORD10220',
            date: '12 Sep 2026',
            product: 'Running Shoes',
            amount: '₹3,999',
            status: 'Delivered',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String product;
  final String amount;
  final String status;
  final VoidCallback onTap;

  const _OrderCard({
    required this.orderId,
    required this.date,
    required this.product,
    required this.amount,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #$orderId',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  status,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(date, style: const TextStyle(color: Colors.grey)),

            const Divider(height: 25),

            Text(
              product,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 5),

            Text(amount),

            const SizedBox(height: 20),

            const Row(
              children: [
                _Step(active: true, text: 'Ordered'),
                Expanded(child: Divider()),
                _Step(active: true, text: 'Packed'),
                Expanded(child: Divider()),
                _Step(active: true, text: 'Shipped'),
                Expanded(child: Divider()),
                _Step(active: false, text: 'Delivered'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final bool active;
  final String text;

  const _Step({required this.active, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(active ? Icons.check_circle : Icons.circle_outlined, size: 18),

        const SizedBox(height: 5),

        Text(text, style: const TextStyle(fontSize: 9)),
      ],
    );
  }
}
