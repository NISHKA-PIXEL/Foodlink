import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../models/food_listing.dart';
import '../../../../repositories/food_repository.dart';
import '../../../../widgets/premium_shell.dart';
import '../../../shared/presentation/screens/food_details_screen.dart';

final foodRepoProvider = Provider((ref) => FoodRepository());
final listingsProvider = StreamProvider((ref) => ref.watch(foodRepoProvider).streamListings());

class UserHomeFeedScreen extends ConsumerWidget {
  const UserHomeFeedScreen({super.key});
  static const route = '/user-home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingsAsync = ref.watch(listingsProvider);

    return PremiumShell(
      title: 'Discover Surplus Meals',
      actions: [IconButton(onPressed: () => Navigator.pushNamed(context, '/notifications'), icon: const Icon(Icons.notifications_none_rounded))],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _FilterChip(label: 'Distance < 3km'),
              _FilterChip(label: 'Veg'),
              _FilterChip(label: 'Price < \$10'),
            ],
          ),
          const SizedBox(height: 18),
          listingsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
            data: (listings) => Column(
              children: listings
                  .map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _FoodCard(item: item),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: AppColors.surfaceSoft,
      side: const BorderSide(color: AppColors.primarySoft),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    );
  }
}

class _FoodCard extends StatefulWidget {
  const _FoodCard({required this.item});
  final FoodListing item;

  @override
  State<_FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<_FoodCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) {
        setState(() => _pressed = false);
        Navigator.pushNamed(context, FoodDetailsScreen.route);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 160),
        scale: _pressed ? 0.98 : 1,
        child: GlassCard(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(widget.item.imageUrl, width: 96, height: 96, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item.foodName, style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text(widget.item.restaurant),
                    const SizedBox(height: 4),
                    Text('$${widget.item.discountedPrice.toStringAsFixed(0)}  ', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                    Text('$${widget.item.originalPrice.toStringAsFixed(0)} · ${widget.item.distanceKm}km · ${widget.item.minutesLeft} min left', style: const TextStyle(decoration: TextDecoration.lineThrough, color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
