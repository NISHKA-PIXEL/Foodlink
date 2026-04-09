import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/premium_shell.dart';
import '../../../impact/presentation/screens/impact_dashboard_screen.dart';
import 'add_surplus_food_screen.dart';

class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});
  static const route = '/restaurant';

  @override
  Widget build(BuildContext context) {
    return PremiumShell(
      title: 'Restaurant Dashboard',
      actions: [IconButton(onPressed: () => Navigator.pushNamed(context, ImpactDashboardScreen.route), icon: const Icon(Icons.insights_rounded))],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good evening, Green Fork 👋', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('Turn today\'s surplus into revenue and measurable impact.'),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(child: _Metric(title: 'Revenue Recovered', value: '\$4,820', icon: Icons.payments_rounded)),
              SizedBox(width: 10),
              Expanded(child: _Metric(title: 'Meals Saved', value: '612', icon: Icons.restaurant_rounded)),
            ],
          ),
          const SizedBox(height: 10),
          const _Metric(title: 'Food Donated', value: '188', icon: Icons.volunteer_activism_rounded),
          const SizedBox(height: 14),
          PremiumButton(text: 'Add Surplus Food', icon: Icons.add_rounded, onPressed: () => Navigator.pushNamed(context, AddSurplusFoodScreen.route)),
          const SizedBox(height: 16),
          Text('Recent Listings', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const _RecentListingCard(name: 'Spinach Pasta', status: 'Claimed', color: AppColors.primary),
          const SizedBox(height: 8),
          const _RecentListingCard(name: 'Vegan Sushi Pack', status: 'Donation Ready', color: AppColors.warning),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.title, required this.value, required this.icon});
  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          Text(title),
        ],
      ),
    );
  }
}

class _RecentListingCard extends StatelessWidget {
  const _RecentListingCard({required this.name, required this.status, required this.color});

  final String name;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          Expanded(child: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: color.withValues(alpha: .16), borderRadius: BorderRadius.circular(12)),
            child: Text(status, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
