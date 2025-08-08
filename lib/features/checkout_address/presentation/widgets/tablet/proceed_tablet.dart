import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
class ProceedTablet extends StatelessWidget {
  final int number;
  final int chosen;
  final List<String> desc;
  const ProceedTablet({super.key, required this.number, required this.chosen, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(number, (index) {
      return Row(
           mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.08,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: index==chosen-1?AppColors.blueComponents:AppColors.labelColor,
                  width: 2.5,
                )
              )
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: index==chosen-1?AppColors.blueComponents:AppColors.labelColor,
                width: 2.5,
              )

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: index!=chosen-1?Text((index+1).toString(),style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),):Icon(Icons.check,color: Colors.black,),

              ),
            ),
          ),
              Container(
              width: MediaQuery.of(context).size.width*0.08,
        decoration: BoxDecoration(
        border: Border(
        bottom: BorderSide(
        color: index==chosen-1?AppColors.blueComponents:AppColors.labelColor,
        width: 2.5,
        )
        )
        ),
              )
        ],
      );
      }),
    );
  }
}
