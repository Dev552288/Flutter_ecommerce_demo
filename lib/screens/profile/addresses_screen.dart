import 'package:flutter/material.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Addresses')),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _AddressCard(
            title: 'Home',
            address: '123 Main Street,\nMumbai, Maharashtra',
          ),

          const SizedBox(height: 15),

          _AddressCard(
            title: 'Office',
            address: '45 Business Park,\nMumbai, Maharashtra',
          ),

          const SizedBox(height: 20),

          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add New Address'),
          ),
        ],
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String title;
  final String address;

  const _AddressCard({required this.title, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 7),

                Text(address, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
    );
  }
}
