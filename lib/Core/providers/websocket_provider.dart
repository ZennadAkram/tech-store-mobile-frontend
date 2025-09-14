import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/Core/network/web_socket_provider.dart';


final webSocketServiceProvider = Provider<WebSocketService>((ref) {
  final service = WebSocketService();
  ref.onDispose(() => service.dispose());
  return service;
});

final webSocketConnectionProvider = StreamProvider<ConnectionStatus>((ref) {
  final webSocketService = ref.watch(webSocketServiceProvider);
  return webSocketService.statusStream;
});