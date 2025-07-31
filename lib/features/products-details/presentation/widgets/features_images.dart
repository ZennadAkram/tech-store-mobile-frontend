import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/products-details/domain/entities/features.dart';
class FeaturesImages extends StatelessWidget {
  final List<Features> features;
  const FeaturesImages({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                width: double.infinity,

                child: Image.network(features[0].imageUrl,fit: BoxFit.cover,)),
            Positioned(
              bottom: 40,
              left: 10,
              right: 10,

              child: Column(
              children: [
                Text('Outplay the Competition',style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500
                )
                ),
                SizedBox(height: 10,),
                Text(features[0].description,style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300
                )
                )
              ],
            ),

            )
          ],
        ),
        Stack(
          children: [
            Container(
              color: AppColors.grayBg.withOpacity(0.2),
              height: 300,
                 padding: EdgeInsets.only(left: 150),
                width: double.infinity,
              child: Image.asset('assets/images/supportgirl.png',fit: BoxFit.cover,)),
            Positioned(
              left: 20,
              top: 30,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                   height: 55,
                    width: screenWidth*0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                     color: AppColors.labelColor
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Product Support',style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        ),)
                        ,
                        IconButton(icon:Icon(Icons.arrow_right_alt_outlined,color: AppColors.blueComponents,), onPressed: () {  },)
                      ],


                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                    height: 55,
                    width: screenWidth*0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: AppColors.labelColor
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('FAQ',style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),)
                        ,
                        IconButton(icon:Icon(Icons.arrow_right_alt_outlined,color: AppColors.blueComponents,), onPressed: () {  },
                        )
                      ],


                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                    height: 55,
                    width: screenWidth*0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: AppColors.labelColor
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Our Buyer Guide',style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),)
                        ,
                        IconButton(icon:Icon(Icons.arrow_right_alt_outlined,color: AppColors.blueComponents,), onPressed: () {  },)
                      ],


                    ),
                  ),


                ],
              ),
            )

          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              Color(0xFF242528),
              Color(0xFF040404),
              
            ])
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text('Features',style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500


              )),
              SizedBox(height: 80,),
             Padding(
               padding: const EdgeInsets.all(15),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,

                 children: List.generate(features.length-1, (index) {

                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       ClipOval(
                         child: Image.network(features[index+1].imageUrl,fit: BoxFit.cover,height: 100,width: 100,),
                       ),
                       SizedBox(height: 20,),
                       Text(features[index+1].description,   textAlign: TextAlign.center,style: TextStyle(

                         color: Colors.white,
                         fontSize: 18,
                         fontWeight: FontWeight.w300
                       ),
                       ),
                       SizedBox(height: 40,),
                     ],
                   );

                 })
               ),
             )
            ]
          ),
          
        )
      ],
    );
  }
}
