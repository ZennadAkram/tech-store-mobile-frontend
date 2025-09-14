import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/Core/network/web_socket_provider.dart';
import 'package:tech_store/features/chatbot/data/repository/chat_repository_impl.dart';
import 'package:tech_store/features/chatbot/presentation/providers/chat_provider.dart';
class ChatbotAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const ChatbotAppBar({super.key});


  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   useEffect((){
     ref.read(chatRepositoryProvider).connect();
     return null;
   },[]);
   final state=ref.watch(chatViewModelProvider);
   final status=state.connectionStatus;
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.only(left: 20, right: 20),

      decoration: BoxDecoration(
        color: AppColors.blueComponents,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ]



      ),

      child: Center(

        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/chatbot.svg',
                      width: 48,
                      height: 48,

                    ),
                    const SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('AI Assistant', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,

                            color: Colors.white)),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: status==ConnectionStatus.connected? Colors.green:status==ConnectionStatus.connecting? Colors.yellow:Colors.red,
                              ),
                            ),
                            const SizedBox(width: 6),

                            status==ConnectionStatus.connected? Text('Online', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.green)):status==ConnectionStatus.connecting? Text('Connecting...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.yellow
                            )):Text('Offline', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.red)),
                          ],
                        )
                      ]
                    )
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline, color: Colors.white,size: 28,))

              ]
          ),

        ),
      ),


    );
  }
}
