import 'package:tech_store/features/cart/domain/entities/cart_update.dart';
import 'package:tech_store/features/products-details/domain/entities/cart.dart';

class CartUpdateModel{
  int quantity;
  int cart;
  int? inputColorId;
  int? version;
  int? productId;
  CartUpdateModel({required this.cart, this.version,required this.quantity, this.inputColorId, this.productId});
  Map<String, dynamic> toJson() {
    if(version != null) {
      return {
        'cart': cart,
        'version': version,
        'quantity': quantity,
        'input_color_id': inputColorId,

      };
    }else{
      return {
        'cart': cart,
        'quantity': quantity,
        'product_id': productId,
      };
    }
  }
  factory CartUpdateModel.fromEntity(CartUpdate cart) {
    return CartUpdateModel(
      cart: cart.cart,
      version: cart.version,
      quantity: cart.quantity,
      inputColorId: cart.inputColorId,
      productId: cart.productId,
    );
  }
}