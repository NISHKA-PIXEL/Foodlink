import 'package:flutter/material.dart';

import '../../../../widgets/premium_shell.dart';
import '../../../ngo/presentation/screens/ngo_donation_feed_screen.dart';
import '../../../restaurant/presentation/screens/restaurant_dashboard_screen.dart';
import '../../../user/presentation/screens/user_home_feed_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});
  static const route = '/role';

  @override
  Widget build(BuildContext context) {
    return PremiumShell(
      title: 'Choose your role',
      child: Column(
        children: [
          _RoleTile(label: 'Restaurant', icon: Icons.storefront_rounded, onTap: () => Navigator.pushNamed(context, RestaurantDashboardScreen.route)),
          const SizedBox(height: 12),
          _RoleTile(label: 'User', icon: Icons.person_rounded, onTap: () => Navigator.pushNamed(context, UserHomeFeedScreen.route)),
          const SizedBox(height: 12),
          _RoleTile(label: 'NGO', icon: Icons.volunteer_activism_rounded, onTap: () => Navigator.pushNamed(context, NgoDonationFeedScreen.route)),
        ],
      ),
    );
  }
}

class _RoleTile extends StatelessWidget {
  const _RoleTile({required this.label, required this.icon, required this.onTap});
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: GlassCard(
        child: Row(
          children: [
            Icon(icon, size: 30),
            const SizedBox(width: 14),
            Expanded(child: Text(label, style: Theme.of(context).textTheme.titleLarge)),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}
