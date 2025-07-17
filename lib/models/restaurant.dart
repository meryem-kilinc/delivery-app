import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teslimat/models/cart_item.dart';
import 'package:teslimat/models/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Klasik Burger",
      description:
          "Özenle hazırlanmış ızgara köfte, taptaze marul,domates ve turşu; hepsi yumuşacık burger ekmeği arasında buluşuyor.Ketçap ve mayonezle taçlandırılan bu klasik lezzet, her lokmada damağınızda iz bırakacak.",
      imagePath: "lib/images/burgers/burger.png",
      price: 225,
      availableAddons: [
        Addon(name: "Ekstra Peynir", price: 40),
        Addon(name: "Mayonez", price: 7),
        Addon(name: "Ketçap", price: 7),
      ],
      category: FoodCategory.burgers,
    ),

    Food(
      name: "abc Burger",
      description:
          "Sıradanın çok ötesinde!Gizli tarifli sos, karamelize soğan, cheddar ve ızgara köftenin mükemmel uyumu.Her lokması sürpriz, her ısırıkta ayrı bir keyif.",
      imagePath: "lib/images/burgers/burger_abc.png",
      price: 245,
      availableAddons: [
        Addon(name: " acı sos", price: 30),
        Addon(name: "Mayonez", price: 7),
        Addon(name: "Ketçap", price: 7),
      ],
      category: FoodCategory.burgers,
    ),
    //desserts
    Food(
      name: "desserts",
      description: "Tatlı ihtiyacınızı karşılacak şey bu",
      imagePath: "lib/images/desserts/dessert.png",
      price: 175,
      availableAddons: [
        Addon(name: "meyve", price: 22),
        Addon(name: "karamel", price: 20),
        Addon(name: "pudra şekeri", price: 13),
      ],
      category: FoodCategory.desserts,
    ),

    Food(
      name: "Çilek akıntısı",
      description: "Çileğin dibine kadar doyacağınız tatlı",
      imagePath: "lib/images/desserts/cilek_dessert.png",
      price: 195,
      availableAddons: [
        Addon(name: "karamel", price: 20),
        Addon(name: "şeker", price: 12),
        Addon(name: "pudra şekeri", price: 13),
      ],
      category: FoodCategory.desserts,
    ),
    //saladas
    Food(
      name: "Ev salatası",
      description: "Evde olduğunuzu hissedeceksiniz",
      imagePath: "lib/images/saladas/ev_salatasi.png",
      price: 145,
      availableAddons: [
        Addon(name: " acı sos", price: 30),
        Addon(name: "limon sos", price: 12),
        Addon(name: "susam", price: 10),
      ],
      category: FoodCategory.salads,
    ),

    Food(
      name: "salata",
      description: "Özel sosla hazırlanmış muhteşem lezzet!",
      imagePath: "lib/images/saladas/salata.png",
      price: 150,
      availableAddons: [
        Addon(name: " nar eşkisi", price: 15),
        Addon(name: "limon sos", price: 12),
        Addon(name: "susam", price: 10),
      ],
      category: FoodCategory.salads,
    ),
    //sides
    Food(
      name: "Mayonez",
      description: "Özenle hazırlanmış mayonez",
      imagePath: "lib/images/sides/mayonez.png",
      price: 45,
      availableAddons: [
        Addon(name: "Yumurta", price: 8),
        Addon(name: "nişasta", price: 7),
        Addon(name: "...", price: 7),
      ],
      category: FoodCategory.sides,
    ),

    Food(
      name: "Ketçap",
      description: "Özenle hazırlanmış ketçap",
      imagePath: "lib/images/sides/ketcap.png",
      price: 225,
      availableAddons: [
        Addon(name: "...", price: 40),
        Addon(name: "domates", price: 15),
        Addon(name: "salça", price: 12),
      ],
      category: FoodCategory.sides,
    ),
    //drinks
    Food(
      name: "Sarı kola",
      description: "İnşaatların vazgeçilmezi",
      imagePath: "lib/images/drinks/kola_sari.png",
      price: 45,
      availableAddons: [
        Addon(name: "meyve", price: 20),
        Addon(name: "...", price: 15),
        Addon(name: "buz", price: 12),
      ],
      category: FoodCategory.drinks,
    ),

    Food(
      name: "Siyah kola",
      description: "Hayatınızdan siyah tek içecek",
      imagePath: "lib/images/drinks/kola_siyah.png",
      price: 45,
      availableAddons: [
        Addon(name: "meyve", price: 20),
        Addon(name: "...", price: 15),
        Addon(name: "buz", price: 12),
      ],
      category: FoodCategory.drinks,
    ),
  ];

  /*

G E T T E R S 

*/

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*

OPARETÖRLER

*/

  //user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );

      return isSameFood && isSameAddons;
    });

    //if item already exists,increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise, add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
double getTotalPrice() {
  double total = 0.0;

  for (CartItem cartItem in _cart) {
    double itemTotal = cartItem.food.price;

    for (Addon addon in cartItem.selectedAddons) {
      itemTotal += addon.price;
    }

    total += itemTotal * cartItem.quantity;
  }

  return total;
}

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();

    notifyListeners();
  }

  /*

HELPERS

 */

  //generate a receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("İşte makbuzunuz.");
    receipt.writeln();

    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      receipt.writeln(formattedDate);
      receipt.writeln();
      receipt.writeln("---------------");

      for(final CartItem in _cart){
        receipt.writeln("${CartItem.quantity} × ${CartItem.food.name} - ${_formatPrice(CartItem.food.price)}");
      if(CartItem.selectedAddons.isEmpty){
        receipt.writeln("    Eklenenler: ${_formatAddons(CartItem.selectedAddons)}");
      }
      receipt.writeln();
      }

      receipt.writeln("----------");
      receipt.writeln();
      receipt.writeln("Toplam Ürün: ${getTotalItemCount()}");
      receipt.writeln("Toplam Ücret: ${_formatPrice(getTotalPrice())}");
  
    return receipt.toString();
  
  } 

  //format double value into money
  String _formatPrice(double price){
    return "\TL${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons){
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})"
    ).join(",");
  }

}
