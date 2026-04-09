import 'package:flutter/material.dart';

import '../../../../widgets/premium_shell.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});
  static const route = '/details';

  @override
  Widget build(BuildContext context) {
    return PremiumShell(
      title: 'Food Details',
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network('https://picsum.photos/seed/hero/1000/600', height: 220, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 18),
          const GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mediterranean Bowl', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                SizedBox(height: 8),
                Text('Freshly packed surplus meal from Green Fork Bistro. Pickup within 40 minutes.'),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('\$7.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)), Text('\$14.00', style: TextStyle(decoration: TextDecoration.lineThrough))],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
