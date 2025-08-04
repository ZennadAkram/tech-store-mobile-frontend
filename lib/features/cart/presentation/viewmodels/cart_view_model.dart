import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/cart/domain/entities/cart.dart';
import 'package:tech_store/features/cart/domain/usecases/delete_item_use_case.dart';
import 'package:tech_store/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:flutter/material.dart';
import 'package:tech_store/features/cart/presentation/providers/providers.dart';
class CartViewModel extends StateNotifier<AsyncValue<Cart>>{
  final FetchCartUseCase cartUseCase;
  final Ref ref;
  double subTotals = 0;
  DeleteItemUseCase deleteItemUseCase;

  final controllerState = TextEditingController();
  final controllerZipCode = TextEditingController();
  final List<String> countries = [
    'Algeria',
    'Germany',
    'France',
    'Canada',
    'United States',
    'India',
    'Japan',
  ];

  CartViewModel(this.cartUseCase, this.deleteItemUseCase, this.ref) : super(const AsyncLoading()) {
  getCart();


  }
  late Cart carts;
  Future<void> getCart() async {
    state = const AsyncLoading();
    try {
      final cart = await cartUseCase();
       carts = cart;
      state = AsyncData(cart);
      calculateSubTotal(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }

  }

  void calculateSubTotal(Map<int, int>? quantityMap) {
    double subTotal = 0;
    for (var item in carts.items) {
      final price = item.product_starting_price?.toDouble()
          ?? (item.version_details?.price as double?) ?? 0;

      final quantity = quantityMap?[item.id] ?? item.quantity;

      subTotal += price * quantity;
    }
    ref.read(subTotalProvider.notifier).state = subTotal;
  }


  Future<void> deleteItem(int id) async {

    try{
      await deleteItemUseCase(id);

      carts.items.removeWhere((element) => element.id == id); // mutate the internal list
      state = AsyncData(carts);

    }catch(e,st){
      state = AsyncError(e,st);
    }

  }
}