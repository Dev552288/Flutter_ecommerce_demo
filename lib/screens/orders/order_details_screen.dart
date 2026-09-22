import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Order #ORD10245',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          const Text(
            'Placed on 18 Sep 2026',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 25),

          _TimelineItem(
            title: 'Order Placed',
            subtitle: '18 Sep, 10:30 AM',
            active: true,
          ),

          _TimelineItem(
            title: 'Order Packed',
            subtitle: '18 Sep, 2:00 PM',
            active: true,
          ),

          _TimelineItem(
            title: 'Shipped',
            subtitle: '19 Sep, 9:00 AM',
            active: true,
          ),

          _TimelineItem(
            title: 'Delivered',
            subtitle: 'Expected 21 Sep',
            active: false,
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),

                SizedBox(height: 10),

                Text(
                  'Debendra Bharatia\n'
                  '123 Main Street\n'
                  'Mumbai, Maharashtra',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool active;

  const _TimelineItem({
    required this.title,
    required this.subtitle,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(active ? Icons.check_circle : Icons.circle_outlined),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
