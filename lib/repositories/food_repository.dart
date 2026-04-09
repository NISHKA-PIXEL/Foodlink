import 'dart:async';

import '../models/food_listing.dart';

class FoodRepository {
  final _controller = StreamController<List<FoodListing>>.broadcast();

  Stream<List<FoodListing>> streamListings() {
    _controller.add(_seedData);
    return _controller.stream;
  }

  List<FoodListing> get donations =>
      _seedData.where((item) => item.minutesLeft < 60).toList(growable: false);

  static final List<FoodListing> _seedData = [
    const FoodListing(
      id: '1',
      restaurant: 'Green Fork Bistro',
      foodName: 'Mediterranean Bowl',
      originalPrice: 14,
      discountedPrice: 7,
      distanceKm: 1.2,
      minutesLeft: 92,
      isVeg: true,
      urgency: 1,
      imageUrl: 'https://picsum.photos/seed/food1/800/600',
    ),
    const FoodListing(
      id: '2',
      restaurant: 'Urban Harvest',
      foodName: 'Pesto Chicken Wrap',
      originalPrice: 12,
      discountedPrice: 6,
      distanceKm: 2.6,
      minutesLeft: 45,
      isVeg: false,
      urgency: 3,
      imageUrl: 'https://picsum.photos/seed/food2/800/600',
    ),
    const FoodListing(
      id: '3',
      restaurant: 'Root & Rise',
      foodName: 'Protein Bento Box',
      originalPrice: 16,
      discountedPrice: 8,
      distanceKm: 0.9,
      minutesLeft: 28,
      isVeg: false,
      urgency: 2,
      imageUrl: 'https://picsum.photos/seed/food3/800/600',
    ),
  ];
}
