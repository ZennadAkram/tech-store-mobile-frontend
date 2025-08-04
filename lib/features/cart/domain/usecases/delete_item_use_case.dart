import 'package:tech_store/features/cart/domain/repository/cart_repository.dart';

class DeleteItemUseCase{
  final CartRepository repository;
  DeleteItemUseCase(this.repository);
  Future<void> call(int id) {
    return repository.deleteItem(id);
  }
}