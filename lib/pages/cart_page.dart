import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teslimat/components/my_button.dart';
import 'package:teslimat/components/my_cart_tile.dart';
import 'package:teslimat/models/cart_item.dart';
import 'package:teslimat/models/restaurant.dart';
import 'package:teslimat/pages/payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart; 

        return Scaffold(
          appBar: AppBar(
            title: const Text('Sepetim'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // Clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Sepeti boşaltmak istediğinize emin misiniz?",
                      ),
                      actions: [
                        // Cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Çıkar"),
                        ),
                        // Yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Kalsın"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              // Sepet listesi
              Expanded(
                child: userCart.isEmpty
                    ? const Center(child: Text("Sepet Boş.."))
                    : ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = userCart[index];
                          return MyCartTile(cartItem: cartItem);
                        },
                      ),
              ),

              // Ödeme butonu
              MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  );
                },
                text: "Ödemeye Git",
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
