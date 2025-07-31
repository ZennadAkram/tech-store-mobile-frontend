import 'package:flutter_riverpod/flutter_riverpod.dart';


class QuantityNotifier extends StateNotifier<int> {
  QuantityNotifier() : super(1);

  void increase(int maxStock) {
    if (state < maxStock) state++;
  }

  void decrease() {
    if (state > 1) state--;
  }

  void reset() {
    state = 1;
  }
}