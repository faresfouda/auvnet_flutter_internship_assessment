import 'package:flutter/material.dart';

class ShortcutItem {
  final String label;
  final String assetName;

  const ShortcutItem({required this.label, required this.assetName});
}

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  static const List<ShortcutItem> shortcuts = [
    ShortcutItem(label: 'Past orders', assetName: 'Vector.png'),
    ShortcutItem(label: 'Super Saver', assetName: 'super_saver.png'),
    ShortcutItem(label: 'Must-tries', assetName: 'must_tries.png'),
    ShortcutItem(label: 'Give Back', assetName: 'give_back.png'),
    ShortcutItem(label: 'Best Sellers', assetName: 'best_sellers.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: shortcuts.map((item) {
        return Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEEE6),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(6),
              child: Image.asset(
                'assets/${item.assetName}',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        );
      }).toList(),
    );
  }
}
