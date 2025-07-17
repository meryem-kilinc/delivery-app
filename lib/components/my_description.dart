import 'package:flutter/material.dart';

class MyDescription extends StatelessWidget {
  const MyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    final mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 12,
    );

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Teslimat Ücreti
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('20 TL', style: myPrimaryTextStyle),
                const SizedBox(height: 5),
                Text('Teslimat ücreti', style: mySecondaryTextStyle),
              ],
            ),

            // Teslimat Süresi
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('20-25 dk', style: myPrimaryTextStyle),
                const SizedBox(height: 5),
                Text('Teslimat Süresi', style: mySecondaryTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
