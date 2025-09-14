import 'package:flutter/material.dart';
import 'package:tech_store/features/chatbot/presentation/views/phone/chatbot_phone_screen.dart';
import 'package:tech_store/features/chatbot/presentation/views/tablet/chatbot_tablet_screen.dart';
import 'package:tech_store/shared/responsive/responsive_layout.dart';
class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(phone:ChatbotPhoneScreen() , tablet: ChatbotTabletScreen() );
  }
}
