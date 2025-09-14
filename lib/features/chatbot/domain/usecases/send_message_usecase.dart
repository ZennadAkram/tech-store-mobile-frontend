import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/chatbot/data/repository/chat_repository_impl.dart';
import 'package:tech_store/features/chatbot/domain/repository/chat_repository.dart';


final sendMessageUseCaseProvider = Provider<SendMessageUseCase>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return SendMessageUseCase(repository);
});

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<void> execute(String message) async {
    return repository.sendMessage(message);
  }
}