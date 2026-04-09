import 'package:flutter/material.dart';

import '../../../../widgets/premium_shell.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  static const route = '/notifications';

  @override
  Widget build(BuildContext context) {
    return PremiumShell(
      title: 'Notifications',
      child: Column(
        children: const [
          _Item(text: 'Your listing “Pesto Chicken Wrap” was claimed.', time: '2m ago'),
          SizedBox(height: 8),
          _Item(text: 'NGO requested pickup for 3 surplus boxes.', time: '18m ago'),
          SizedBox(height: 8),
          _Item(text: 'You reduced 28kg CO₂ this week. Great progress!', time: '1h ago'),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.text, required this.time});
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          const Icon(Icons.notifications_active_rounded),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
          Text(time),
        ],
      ),
    );
  }
}
