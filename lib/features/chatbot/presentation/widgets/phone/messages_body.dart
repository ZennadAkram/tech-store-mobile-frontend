import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/chatbot/presentation/providers/chat_provider.dart';
import 'package:tech_store/features/chatbot/presentation/widgets/phone/loading_bable.dart';
import 'package:tech_store/features/chatbot/presentation/widgets/phone/message_bable_ai.dart';
import 'package:tech_store/features/chatbot/presentation/widgets/phone/message_bable_system.dart';
import 'package:tech_store/features/chatbot/presentation/widgets/phone/message_bable_user.dart';
import 'package:tech_store/shared/enums/message_type.dart';

class MessagesBody extends ConsumerStatefulWidget {
  const MessagesBody({super.key});

  @override
  ConsumerState<MessagesBody> createState() => _MessagesBodyState();
}

class _MessagesBodyState extends ConsumerState<MessagesBody> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatViewModelProvider);
    final isLoading = chatState.isLoading;
    final messages = chatState.messages;

    // 🔥 Scroll down when messages or loading state changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 22, right: 22),
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        itemCount: messages.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (isLoading && index == messages.length) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 65),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TypingIndicator(),
              ),
            );
          }

          final message = messages[index];

          Widget bubble;
          Alignment alignment;

          switch (message.type) {
            case MessageType.user:
              bubble =
                  MessageBableUser(message.content, message.timestamp);
              alignment = Alignment.centerRight;
              break;
            case MessageType.ai:
              bubble =
                  MessageBableAi(message: message.content, time: message.timestamp);
              alignment = Alignment.centerLeft;
              break;
            case MessageType.system:
              bubble = MessageBableSystem(message: message.content);
              alignment = Alignment.center;
              break;
            default:
              return const SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 65),
            child: Align(
              alignment: alignment,
              child: bubble,
            ),
          );
        },
      ),
    );
  }
}
