import 'package:flutter/material.dart';

import '../../../auth/presentation/screens/login_signup_screen.dart';
import '../../../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const route = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1300))..forward();

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 1850), () {
      if (mounted) Navigator.pushReplacementNamed(context, LoginSignupScreen.route);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: CurvedAnimation(parent: _controller, curve: Curves.easeOut),
          child: ScaleTransition(
            scale: Tween(begin: 0.92, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primarySoft]),
                    boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: .35), blurRadius: 34)],
                  ),
                  child: const Icon(Icons.eco_rounded, size: 54, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text('FoodLink', style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 8),
                const Text('Convert surplus into impact.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
