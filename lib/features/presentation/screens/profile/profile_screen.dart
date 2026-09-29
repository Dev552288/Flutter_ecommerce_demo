import 'package:flutter/material.dart';

import '../orders/orders_screen.dart';
import 'addresses_screen.dart';
import 'settings_screen.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                color: Color(0xFFE8E6FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, size: 50),
            ),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              'Debendra Bharatia',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 5),

          const Center(
            child: Text(
              'debendra@example.com',
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(height: 30),

          _ProfileOption(
            icon: Icons.shopping_bag_outlined,
            title: 'My Orders',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrdersScreen()),
              );
            },
          ),

          _ProfileOption(
            icon: Icons.location_on_outlined,
            title: 'My Addresses',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddressesScreen()),
              );
            },
          ),

          _ProfileOption(
            icon: Icons.favorite_border,
            title: 'Wishlist',
            onTap: () {},
          ),

          _ProfileOption(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),

          _ProfileOption(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
