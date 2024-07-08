import 'package:myapp/screens/homescreen.dart';

class Cart {
  static List<CartItem> _cartItems = [];

  static List<CartItem> get cartItems => _cartItems;

  static void addToCart(Medicine medicine) {
    // Check if the medicine is already in cart
    CartItem? existingItem = _cartItems.firstWhere(
      (item) => item.medicine.name == medicine.name,
      orElse: () => CartItem(medicine: medicine, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      // If medicine is not in cart, add it with quantity 1
      _cartItems.add(CartItem(medicine: medicine, quantity: 1));
    } else {
      // If medicine is already in cart, increase quantity
      existingItem.quantity++;
    }
  }

  static void removeFromCart(Medicine medicine) {
    _cartItems.removeWhere((item) => item.medicine.name == medicine.name);
  }

  static double get totalPrice {
    return _cartItems.fold(0, (total, current) => total + (current.medicine.price * current.quantity));
  }
}

class CartItem {
  final Medicine medicine;
  int quantity;

  CartItem({required this.medicine, required this.quantity});
}
