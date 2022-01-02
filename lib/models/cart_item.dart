class CartItem {
  final String id;
  final double price;
  final String title;
  int quantity;

  CartItem(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.title});
}
