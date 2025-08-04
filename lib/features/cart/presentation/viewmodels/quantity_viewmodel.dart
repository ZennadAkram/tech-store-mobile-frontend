import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/cart/domain/entities/cart.dart';

class QuantityViewModel extends StateNotifier<Map<int, int>>{
  QuantityViewModel() : super({});

  void increase(int itemId, int maxStock) {
    final current = state[itemId] ?? 0;
    if (current < maxStock) {
      state = {...state, itemId: current + 1};
    }
  }



  // Decrease quantity
  void decrease(int itemId) {
    final current = state[itemId] ?? 0;
    if (current > 0) {
      state = {...state, itemId: current - 1};
    }
  }

  // Get quantity for specific item
  int getQuantity(int itemId) => state[itemId] ?? 0;

}