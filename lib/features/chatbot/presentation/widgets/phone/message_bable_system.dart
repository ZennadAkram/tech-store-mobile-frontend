import 'package:flutter/material.dart';
class MessageBableSystem extends StatelessWidget {
  final String message;
  const MessageBableSystem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width*0.17,
              ),
              padding: EdgeInsets.only(top: 16,right: 16,left: 20,bottom: 20),
              decoration: BoxDecoration(
                  color: Color(0xFFFFC107),
                  borderRadius: BorderRadius.circular(12



                  )
              ),
              child: Text(message,style: TextStyle(
                  color:Color(0xFFFFFDE7),
                  fontSize: 16
              ),),


            ),
          ],
        )
      ]
    );
  }
}
