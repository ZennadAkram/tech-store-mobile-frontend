class CartUpdate{
  int cart;
  int? version;
  int quantity;
  int? inputColorId;
  int? productId;
  CartUpdate({required this.cart, this.version,required this.quantity, this.inputColorId, this.productId});
}