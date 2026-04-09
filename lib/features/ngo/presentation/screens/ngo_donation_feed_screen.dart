import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../models/food_listing.dart';
import '../../../../repositories/food_repository.dart';
import '../../../../widgets/premium_shell.dart';

final ngoFoodProvider = Provider((ref) => FoodRepository().donations);

class NgoDonationFeedScreen extends ConsumerWidget {
  const NgoDonationFeedScreen({super.key});
  static const route = '/ngo-feed';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donations = ref.watch(ngoFoodProvider);
    return PremiumShell(
      title: 'NGO Donation Feed',
      child: Column(
        children: donations.map((d) => Padding(padding: const EdgeInsets.only(bottom: 10), child: _DonationCard(donation: d))).toList(),
      ),
    );
  }
}

class _DonationCard extends StatelessWidget {
  const _DonationCard({required this.donation});
  final FoodListing donation;

  @override
  Widget build(BuildContext context) {
    final color = donation.minutesLeft < 35 ? AppColors.danger : AppColors.warning;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(donation.foodName, style: const TextStyle(fontWeight: FontWeight.w700))),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text('${donation.restaurant} • ${donation.minutesLeft} min left'),
          const SizedBox(height: 12),
          PremiumButton(text: 'Claim Donation', icon: Icons.handshake_rounded, onPressed: () {}),
        ],
      ),
    );
  }
}
