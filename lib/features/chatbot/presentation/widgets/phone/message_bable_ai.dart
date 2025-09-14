import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/chatbot/presentation/widgets/phone/triangle_ai.dart';
class MessageBableAi extends StatelessWidget {

  const MessageBableAi({super.key, required this.message, required this.time});
  final String message;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
              constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width*0.17,
              ),
              padding: EdgeInsets.only(top: 16,right: 16,left: 20,bottom: 20),
              decoration: BoxDecoration(
              color: Color.fromRGBO(222, 226, 230,1),
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),

              )
              ),
              child: Text(message,style: TextStyle(
              color:Color.fromRGBO(68, 68,68,1),
              fontSize: 16
              ),),


              ),
              Positioned(
              bottom: -50,
              left: 0,
              child:  ClipPath(
              clipper: TriangleClipperAi(),
              child: Container(
              width: 50,
              height: 50,
              color: Color.fromRGBO(222, 226, 230,1),
              ),

          )),
              Positioned(
                bottom: -52,
                left: -15,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: AppColors.blueComponents,
                    shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset('assets/icons/chatbot.svg',
                  width: 32.23, height: 33),
                ),

              ),

              Positioned(
                  bottom: -23,
                  right: 5,
                  child: Text(time.hour.toString()+":"+(time.minute<10?"0"+time.minute.toString():time.minute.toString()),style: TextStyle(
                      color: Color.fromRGBO(136, 136, 136,1),
                      fontSize: 12
                  ),)
              )
                ]

              ),
        )
      ]);
  }
}
