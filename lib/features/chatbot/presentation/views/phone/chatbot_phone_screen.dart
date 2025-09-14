import 'package:flutter/material.dart';
import 'package:tech_store/features/chatbot/presentation/widgets/phone/chatbot_app_bar.dart';
import 'package:tech_store/features/chatbot/presentation/widgets/phone/messages_body.dart';
import 'package:tech_store/features/chatbot/presentation/widgets/phone/text_field_container.dart';
class ChatbotPhoneScreen extends StatelessWidget {
  const ChatbotPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: ChatbotAppBar(),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,

              color: Colors.white,
              child: MessagesBody(),
            ),
          ),
          TextFieldContainer()
        ]
            ),
    );
  }
}
