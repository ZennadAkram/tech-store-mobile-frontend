import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/chatbot/presentation/providers/chat_provider.dart';
class TextFieldContainer extends ConsumerWidget {
  const TextFieldContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(chatViewModelProvider).isLoading;
    final viewModel = ref.read(chatViewModelProvider.notifier);
    final messageController = TextEditingController();

    return  Container(
      width: double.infinity,
      height: 160,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 2),
          ),
        ]


      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
       children: [
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               ElevatedButton(onPressed:isLoading ? null: (){
                 viewModel.sendMessage('show me the products you have');
               },

                   
                   style: ElevatedButton.styleFrom(

                     padding: EdgeInsets.only(left: 15,right: 15),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)
                     ),
                     backgroundColor: Color.fromRGBO(243, 245, 246,1)
                   ),

                   
                   child:

               Text('🛍️ Products',style: TextStyle(
                 color: Color.fromRGBO(68, 68, 68,1)
               ),)),
             const  SizedBox(width: 10,),
               ElevatedButton(onPressed:isLoading ? null: (){
                 viewModel.sendMessage('show me the orders');
               },

                   style: ElevatedButton.styleFrom(
                     padding: EdgeInsets.only(left: 18,right: 18),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       backgroundColor: Color.fromRGBO(243, 245, 246,1)
                   ),

                   child:

                   Text('📦 Orders',style: TextStyle(
                       color: Color.fromRGBO(68, 68, 68,1)
                   ),)),
               const  SizedBox(width: 10,),
               ElevatedButton(onPressed:isLoading ? null: (){
                 viewModel.sendMessage('show me the FAQs');
               },

                   style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       backgroundColor: Color.fromRGBO(243, 245, 246,1)
                   ),

                   child:

                   Text('🙋‍♂️ FAQs',style: TextStyle(
                       color: Color.fromRGBO(68, 68, 68,1)
                   ),)),
               const  SizedBox(width: 10,),
               ElevatedButton(onPressed:isLoading ? null: (){
                 viewModel.sendMessage('show me the shopping cart');
               },

                   style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       backgroundColor: Color.fromRGBO(243, 245, 246,1)
                   ),

                   child:

                   Text('🛒 Shopping cart',style: TextStyle(
                       color: Color.fromRGBO(68, 68, 68,1)
                   ),)),
               const  SizedBox(width: 10,),
               ElevatedButton(onPressed:isLoading ? null: (){
                 viewModel.sendMessage('give me prices of some products  ');
               },

                   style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       backgroundColor: Color.fromRGBO(243, 245, 246,1)
                   ),

                   child:

                   Text('💰 Pricing',style: TextStyle(
                       color: Color.fromRGBO(68, 68, 68,1)
                   ),)),


             ],
           ),
         ),
         const SizedBox(height: 10,),
         TextField(
           enabled: !isLoading,
           controller: messageController,

           decoration: InputDecoration(

             filled: true,
             fillColor: Color.fromRGBO(232, 235, 240,1),
             hintText: isLoading ? 'AI is typing...' : 'Ask me anything...',
             contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 18),
             border: OutlineInputBorder(

               borderRadius: BorderRadius.circular(16),
               borderSide: BorderSide.none
             ),
             suffixIcon:  IconButton(
               onPressed: () {
                 // 👇 Your button action here
                 viewModel.sendMessage(messageController.text);
                 messageController.clear();

               },
               icon: SvgPicture.asset(

                 "assets/icons/send.svg",
                 width: 27,
                 height: 27,
                 color:isLoading? Colors.blueAccent[100]:AppColors.blueComponents,

                 // optional
               ),
             ),
           )
         )
       ],
      ),


    );
  }
}
