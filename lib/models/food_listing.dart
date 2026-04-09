class FoodListing {
  const FoodListing({
    required this.id,
    required this.restaurant,
    required this.foodName,
    required this.originalPrice,
    required this.discountedPrice,
    required this.distanceKm,
    required this.minutesLeft,
    required this.isVeg,
    required this.urgency,
    required this.imageUrl,
  });

  final String id;
  final String restaurant;
  final String foodName;
  final double originalPrice;
  final double discountedPrice;
  final double distanceKm;
  final int minutesLeft;
  final bool isVeg;
  final int urgency;
  final String imageUrl;
}
