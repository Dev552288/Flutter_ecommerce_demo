import 'package:ecommerce_app/core/utils/date_picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_app/features/presentation/providers/auth_provider.dart';
import 'package:ecommerce_app/features/presentation/state/auth_state.dart';
import 'package:ecommerce_app/features/presentation/state/auth_status.dart';
import 'login_screen.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final dobController =
      TextEditingController(); // Fixed typo in controller name

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    mobileNumberController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to authentication status changes
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.status == AuthStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully! Please log in.'),
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      } else if (next.status == AuthStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage ?? 'Registration failed')),
        );
      }
    });

    final authState = ref.watch(authProvider);
    final isLoading = authState.status == AuthStatus.laoding;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create your account',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Join ShopEasy and start shopping',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 35),

            // Name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Full name',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 18),

            // Email
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 18),

            // Username (obscureText removed)
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 18),

            // Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 18),

            // Mobile Number (obscureText removed)
            TextField(
              controller: mobileNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Mobile Number',
                prefixIcon: Icon(Icons.mobile_friendly),
              ),
            ),
            const SizedBox(height: 18),

            // Date of Birth (obscureText removed)
            TextField(
              controller: dobController,
              readOnly: true,
              onTap: () {
                DatePickerHelper.selectDate(
                  context: context,
                  controller: dobController,
                );
              },
              decoration: const InputDecoration(
                hintText: 'Date Of Birth (YYYY-MM-DD)',
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 30),

            // Register Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    isLoading
                        ? null
                        : () {
                          // Trigger signup function in AuthProvider
                          ref
                              .read(authProvider.notifier)
                              .signup(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                username: usernameController.text.trim(),
                                password: passwordController.text,
                                mobileNumber:
                                    mobileNumberController.text.trim(),
                                dob: dobController.text.trim(),
                              );
                        },
                child:
                    isLoading
                        ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
