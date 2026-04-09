import 'package:flutter/material.dart';

import '../../../../widgets/premium_shell.dart';

class AddSurplusFoodScreen extends StatefulWidget {
  const AddSurplusFoodScreen({super.key});
  static const route = '/add-surplus';

  @override
  State<AddSurplusFoodScreen> createState() => _AddSurplusFoodScreenState();
}

class _AddSurplusFoodScreenState extends State<AddSurplusFoodScreen> {
  bool pickup = true;

  @override
  Widget build(BuildContext context) {
    return PremiumShell(
      title: 'Add Surplus Food',
      child: Column(
        children: [
          const TextField(decoration: InputDecoration(labelText: 'Food Name')),
          const SizedBox(height: 10),
          const TextField(decoration: InputDecoration(labelText: 'Quantity')),
          const SizedBox(height: 10),
          const TextField(decoration: InputDecoration(labelText: 'Original Price')),
          const SizedBox(height: 10),
          const TextField(decoration: InputDecoration(labelText: 'Discounted Price')),
          const SizedBox(height: 10),
          const TextField(decoration: InputDecoration(labelText: 'Expiry Time')),
          const SizedBox(height: 10),
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value: true, label: Text('Pickup'), icon: Icon(Icons.shopping_bag_rounded)),
              ButtonSegment(value: false, label: Text('Delivery'), icon: Icon(Icons.delivery_dining_rounded)),
            ],
            selected: {pickup},
            onSelectionChanged: (s) => setState(() => pickup = s.first),
          ),
          const SizedBox(height: 16),
          const GlassCard(
            child: Row(
              children: [
                Icon(Icons.image_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Upload Food Image')),
                Icon(Icons.upload_file_rounded),
              ],
            ),
          ),
          const SizedBox(height: 18),
          PremiumButton(text: 'Publish Listing', icon: Icons.check_rounded, onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Listing published successfully.')))),
        ],
      ),
    );
  }
}
