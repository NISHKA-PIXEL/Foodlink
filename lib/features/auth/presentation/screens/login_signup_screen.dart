import 'package:flutter/material.dart';

import '../../../../widgets/premium_shell.dart';
import 'role_selection_screen.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});
  static const route = '/auth';

  @override
  Widget build(BuildContext context) {
    return PremiumShell(
      title: 'Welcome back',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Login to FoodLink', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 34)),
          const SizedBox(height: 10),
          const Text('Scale your sustainability impact with real-time surplus matching.'),
          const SizedBox(height: 22),
          const TextField(decoration: InputDecoration(labelText: 'Email')),
          const SizedBox(height: 12),
          const TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
          const SizedBox(height: 20),
          PremiumButton(text: 'Continue', onPressed: () => Navigator.pushNamed(context, RoleSelectionScreen.route)),
          const SizedBox(height: 12),
          const Center(child: Text('No account? Sign up in 30 seconds.')),
        ],
      ),
    );
  }
}
