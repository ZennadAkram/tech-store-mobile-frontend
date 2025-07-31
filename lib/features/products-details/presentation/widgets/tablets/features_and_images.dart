import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/products-details/domain/entities/features.dart';
class FeaturesAndImages extends StatelessWidget {
  final List<Features> features;
  const FeaturesAndImages({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 394,
              color: Color(0xFF050606),
            ),
            Positioned(
               bottom: 0,
                right: 0,
                child: SizedBox(
                    height: 356,
                    width: MediaQuery.of(context).size.width*0.8,

                    child: Image.network(features[0].imageUrl,fit: BoxFit.fill,))),
            Positioned(
              top: 60,
              left: 30,
              right: screenWidth*0.4,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: screenWidth*0.5,
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
                    width: screenWidth*0.5,
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
                    width: screenWidth*0.5,
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
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics()
                    ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,       // number of columns
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,

                    // spacing between columns
                    mainAxisSpacing: 10,),
                    itemCount: features.length-1,
                    itemBuilder: (BuildContext context, int index) {
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

                      ],
                    );
                },)
                )
              ]
          ),

        )
      ],
    );
  }
}
