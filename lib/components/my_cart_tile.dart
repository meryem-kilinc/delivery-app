import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teslimat/components/my_quantity_selector.dart';
import 'package:teslimat/models/cart_item.dart';
import 'package:teslimat/models/restaurant.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            // Üst kısım: resim + isim + fiyat + miktar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Görsel
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 10),

                  // İsim + Fiyat
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.food.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${cartItem.food.price.toStringAsFixed(2)} TL',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary,),),
                    ],
                  ),

                  const Spacer(),

                  // Miktar artır/azalt
                  QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    },
                    onIncrement: () {
                      restaurant.addToCart(
                        cartItem.food,
                        cartItem.selectedAddons,
                      );
                    },
                  ),
                ],
              ),
            ),

            // Alt kısım: Seçili addonlar
            if (cartItem.selectedAddons.isNotEmpty)
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                  children: cartItem.selectedAddons.map((addon) =>
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Row(
                          children: [
                            Text(addon.name),
                      
                            Text(addon.price.toString()+'TL'),
                          ],
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          )
                        ),
                        onSelected: (value) {},
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
