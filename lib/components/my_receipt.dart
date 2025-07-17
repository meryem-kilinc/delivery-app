import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teslimat/models/restaurant.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25,top: 25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Siparişiniz için teşekkürler :)"),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                builder: (context,Restaurant,child) => Text(
                  Restaurant.displayCartReceipt()),
            ),
            ),

            const SizedBox(height: 25),
            const Text("Tahmini teslimat süresi: 16:10"),

          ],
        ),
      ),
      );
  }
}