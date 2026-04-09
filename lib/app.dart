import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/login_signup_screen.dart';
import 'features/auth/presentation/screens/role_selection_screen.dart';
import 'features/impact/presentation/screens/impact_dashboard_screen.dart';
import 'features/ngo/presentation/screens/ngo_donation_feed_screen.dart';
import 'features/notifications/presentation/screens/notifications_screen.dart';
import 'features/restaurant/presentation/screens/add_surplus_food_screen.dart';
import 'features/restaurant/presentation/screens/restaurant_dashboard_screen.dart';
import 'features/shared/presentation/screens/food_details_screen.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'features/user/presentation/screens/user_home_feed_screen.dart';

class FoodLinkApp extends StatelessWidget {
  const FoodLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodLink',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (_) => const SplashScreen(),
        LoginSignupScreen.route: (_) => const LoginSignupScreen(),
        RoleSelectionScreen.route: (_) => const RoleSelectionScreen(),
        RestaurantDashboardScreen.route: (_) => const RestaurantDashboardScreen(),
        AddSurplusFoodScreen.route: (_) => const AddSurplusFoodScreen(),
        UserHomeFeedScreen.route: (_) => const UserHomeFeedScreen(),
        NgoDonationFeedScreen.route: (_) => const NgoDonationFeedScreen(),
        FoodDetailsScreen.route: (_) => const FoodDetailsScreen(),
        ImpactDashboardScreen.route: (_) => const ImpactDashboardScreen(),
        NotificationsScreen.route: (_) => const NotificationsScreen(),
      },
    );
  }
}
