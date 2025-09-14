import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/Core/network/web_socket_provider.dart';
import 'package:tech_store/Core/providers/websocket_provider.dart';
import 'package:tech_store/features/chatbot/data/repository/chat_repository_impl.dart';
import 'package:tech_store/features/chatbot/domain/entities/message_entity.dart';
import 'package:tech_store/features/chatbot/presentation/providers/chat_provider.dart';
import 'package:tech_store/features/chatbot/presentation/viewmodels/chat_viewmodel.dart';
import 'package:tech_store/shared/enums/message_type.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _messageFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  void _initializeChat() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chatRepositoryProvider).connect();
      _focusTextFieldWithDelay();
    });
  }

  void _focusTextFieldWithDelay() {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        _messageFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    final viewModel = ref.read(chatViewModelProvider.notifier);
    viewModel.sendMessage(message);
    _messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _showDebugInfo() {
    final chatState = ref.read(chatViewModelProvider);
    final webSocketService = ref.read(webSocketServiceProvider);

    debugPrint('''
=== CHAT DEBUG INFO ===
Connection Status: ${chatState.connectionStatus}
Is Loading: ${chatState.isLoading}
Messages Count: ${chatState.messages.length}
WebSocket Connected: ${webSocketService.status == ConnectionStatus.connected}
Text Field Focus: ${_messageFocusNode.hasFocus ? "Focused" : "Not focused"}
=======================
''');
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatViewModelProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Shopping Assistant',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          _buildConnectionStatus(chatState.connectionStatus),
          const SizedBox(width: 12),
          _buildDebugButton(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(chatState),
          ),
          _buildMessageInput(chatState, theme),
        ],
      ),
      floatingActionButton: _buildDebugFloatingButton(),
    );
  }

  Widget _buildConnectionStatus(ConnectionStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getStatusColor(status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: _getStatusColor(status),
            size: 10,
          ),
          const SizedBox(width: 6),
          Text(
            _getStatusText(status).toUpperCase(),
            style: TextStyle(
              color: _getStatusColor(status),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDebugButton() {
    return IconButton(
      icon: const Icon(Icons.analytics_outlined),
      onPressed: _showDebugInfo,
      tooltip: 'Connection Info',
      color: Colors.blueGrey,
    );
  }

  Widget _buildDebugFloatingButton() {
    return FloatingActionButton(
      onPressed: _showDebugInfo,
      backgroundColor: Colors.blueGrey,
      mini: true,
      child: const Icon(Icons.info_outline, size: 20),
    );
  }

  Color _getStatusColor(ConnectionStatus status) {
    switch (status) {
      case ConnectionStatus.connected:
        return Colors.green;
      case ConnectionStatus.connecting:
        return Colors.orange;
      case ConnectionStatus.disconnected:
        return Colors.red;
      case ConnectionStatus.error:
        return Colors.red;
      case ConnectionStatus.unauthorized:
        return Colors.purple;
    }
  }

  String _getStatusText(ConnectionStatus status) {
    return status.toString().split('.').last;
  }

  Widget _buildMessageList(ChatState chatState) {
    if (chatState.messages.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      itemCount: chatState.messages.length,
      itemBuilder: (context, index) {
        final message = chatState.messages[index];
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: 72,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 20),
          Text(
            'Start a Conversation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ask me about products, orders, or anything else!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(MessageEntity message) {
    final isUser = message.type == MessageType.user;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _getBubbleColor(message.type),
                borderRadius: _getBubbleBorderRadius(message.type),
                boxShadow: [
                  if (!isUser)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isUser && message.username != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        message.username!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _getTextColor(message.type)?.withOpacity(0.8),
                        ),
                      ),
                    ),
                  Text(
                    message.content,
                    style: TextStyle(
                      color: _getTextColor(message.type),
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _formatTime(message.timestamp),
                    style: TextStyle(
                      color: _getTextColor(message.type)?.withOpacity(0.6),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getBubbleColor(MessageType type) {
    switch (type) {
      case MessageType.user:
        return Theme.of(context).primaryColor;
      case MessageType.ai:
        return Colors.grey[50]!;
      case MessageType.system:
        return Colors.blue[50]!;
      case MessageType.error:
        return Colors.red[50]!;
    }
  }

  Color? _getTextColor(MessageType type) {
    switch (type) {
      case MessageType.user:
        return Colors.white;
      default:
        return Colors.grey[800];
    }
  }

  BorderRadius _getBubbleBorderRadius(MessageType type) {
    const radius = Radius.circular(18);
    return BorderRadius.only(
      topLeft: type == MessageType.user ? radius : const Radius.circular(6),
      topRight: type == MessageType.user ? const Radius.circular(6) : radius,
      bottomLeft: radius,
      bottomRight: radius,
    );
  }

  String _formatTime(DateTime timestamp) {
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }

  Widget _buildMessageInput(ChatState chatState, ThemeData theme) {
    final isConnected = chatState.connectionStatus == ConnectionStatus.connected;
    final isLoading = chatState.isLoading;
    final isEnabled = isConnected && !isLoading;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border(top: BorderSide(color: theme.dividerColor.withOpacity(0.1))),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              focusNode: _messageFocusNode,
              decoration: InputDecoration(
                hintText: isEnabled ? 'Type your message...' : 'Connecting...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: isEnabled ? Colors.grey[50] : Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                suffixIcon: isEnabled
                    ? null
                    : const Icon(Icons.sync, size: 20, color: Colors.grey),
              ),
              onSubmitted: isEnabled ? (_) => _sendMessage() : null,
              enabled: isEnabled,
              maxLines: 3,
              minLines: 1,
            ),
          ),
          const SizedBox(width: 12),
          _buildSendButton(chatState, theme),
        ],
      ),
    );
  }

  Widget _buildSendButton(ChatState chatState, ThemeData theme) {
    final isConnected = chatState.connectionStatus == ConnectionStatus.connected;
    final isLoading = chatState.isLoading;
    final isEnabled = isConnected && !isLoading;

    if (isLoading) {
      return Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(12),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(theme.primaryColor),
        ),
      );
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isEnabled ? theme.primaryColor : Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          Icons.send_rounded,
          color: isEnabled ? Colors.white : Colors.grey[500],
          size: 20,
        ),
        onPressed: isEnabled ? _sendMessage : null,
        tooltip: isEnabled ? 'Send message' : 'Waiting for connection...',
        padding: EdgeInsets.zero,
      ),
    );
  }
}