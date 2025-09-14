import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/chatbot/domain/entities/message_entity.dart';
import 'package:tech_store/features/chatbot/data/repository/chat_repository_impl.dart';
import 'package:tech_store/features/chatbot/domain/usecases/send_message_usecase.dart';
import 'package:tech_store/features/chatbot/presentation/viewmodels/chat_viewmodel.dart';

final chatViewModelProvider = StateNotifierProvider<ChatViewModel, ChatState>((ref) {
  final sendMessageUseCase = ref.watch(sendMessageUseCaseProvider);
  return ChatViewModel(sendMessageUseCase, ref);
});

final chatMessagesProvider = StreamProvider<List<MessageEntity>>((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  final chatViewModel = ref.watch(chatViewModelProvider.notifier);

  return chatRepository.messages.map((messageEntity) {
    // Use postFrameCallback to avoid modifying state during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatViewModel.addMessage(messageEntity);
    });
    return ref.watch(chatViewModelProvider).messages;
  });
});