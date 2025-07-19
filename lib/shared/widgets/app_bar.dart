import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';

class AppBarCostume extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCostume({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(170); // total height

  @override
  Widget build(BuildContext context) {
    double TextFaildWidth= MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none, // allow overflow
      children: [
        // 🔵 Bottom full-width container (like the second blue bar)
        Container(
          height: 135,
          width: double.infinity,
          color: AppColors.blueComponents,
          child: Padding(
            padding: const EdgeInsets.only(top: 42),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                Padding(
                  padding: EdgeInsetsGeometry.only(left: 1),
                  child: Builder(
                    builder: (context) => IconButton(
                      padding: EdgeInsets.zero, // ✅ Remove internal padding
                      icon: const Icon(Icons.menu, size: 35, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ),

                Container(

                  width:TextFaildWidth*0.6 ,
                  height: 50,
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "Search here",
                     prefixIcon: Icon(Icons.search_rounded, size: 30, color: AppColors.labelColor,),
                      hintStyle: TextStyle(
                      color: AppColors.ChipChoice,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,

                        
                      ),
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                          color: Colors.white

                        ),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,

                        ),
                        borderRadius: BorderRadius.circular(25)
                      )
                      
                    ),
                  ),
                ),

                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,

                      children: [
                        IconButton(
                          onPressed: () {

                          },
                          icon: SvgPicture.asset(
                            'assets/icons/cart.svg',
                            width: 32,
                            height: 32,
                            // Optional, only works if SVG path fill is not hardcoded
                          ),
                        ),
                        Positioned(
                             left: 25,
                            top: -1,
                            child: Container(
                              height: 17,
                              width: 17,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Center(
                                child: Text('2',style: TextStyle(
                                  color: AppColors.blueComponents,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),

                        )),

                      ],

                    ),
                    IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/profileicon.svg',
                        width: 32,
                        height: 32))
                  ],
                ),




              ],
            ),
          ),
        ),

        // ⚫️ Black bar background (optional visual base)
        Positioned(
          top: 0, // shifts upward to create overlap effect
          left: 0,
          right: 0,
          child: Container(
            height: 50,
            color: Colors.black,
          ),
        ),

        // 🔵 Floating rounded icon container
        Positioned(
          top: 0, // to make it float
          left: 30,
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.blueComponents,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.layers_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
