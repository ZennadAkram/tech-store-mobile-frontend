import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/shared/providers/toggle_providers.dart';
class HelpAndSupportTablet extends ConsumerWidget {
  const HelpAndSupportTablet({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isVisible = ref.watch(passwordVisibleProvider);
    final toggle = ref.read(passwordVisibleProvider.notifier);
    final isVisible1=ref.watch(toggle1Provider);
    final toggle1 =ref.read(toggle1Provider.notifier);
    final isVisible2=ref.watch(toggle2Provider);
    final toggle2 =ref.read(toggle2Provider.notifier);
    final isVisible3=ref.watch(toggle3Provider);
    final toggle3 =ref.read(toggle3Provider.notifier);
    final isVisible4=ref.watch(toggle4Provider);
    final toggle4 =ref.read(toggle4Provider.notifier);

    double textfeildwidth=MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.SupportBg
      ),
      width: double.infinity,
      child: Padding(padding: EdgeInsets.only(left: 24,right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Sign Up To Our Newsletter.',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white
                    ),),
                    Text('Be the first to hear about the latest offers.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                ),
                SizedBox(width: 30,),
                SizedBox(
                  width:textfeildwidth*0.28 ,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Your Email',
                        helperStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2

                          ),

                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4)
                        )
                    ),
                  ),
                ),

                ElevatedButton(onPressed: (){},

                  style:
                  ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blueComponents,
                      minimumSize: Size(textfeildwidth*0.22, 60)
                  ), child: Text('Subscribe',
                      style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white) ),

                ),
              ],
            ),
            SizedBox(height: 24,),
            Column(
              children: [
                //information container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                          color: AppColors.IconsBg,
                          width: 1
                      ))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0,right: 2,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Information',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color:AppColors.IconsBg
                            ),),
                            IconButton(
                              onPressed: () => toggle.state = !isVisible,
                              icon: Icon(
                                isVisible ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: AppColors.IconsBg,
                              ),
                            )

                          ],
                        ),

                        Visibility(
                          visible: isVisible,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2 , right:2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(onPressed: (){},

                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                      minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                      alignment: Alignment.centerLeft, // optional: left-aligns text
                                    ),
                                    child: Text('About Us',style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: AppColors.quantityBar
                                    ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Contact Us',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Privacy Policy',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Terms & Conditions',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Orders and Returns',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('FAQ',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Pc container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                          color: AppColors.IconsBg,
                          width: 1
                      ))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0,right: 2,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('PC Parts',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color:AppColors.IconsBg
                            ),),
                            IconButton(
                              onPressed: () => toggle1.state = !isVisible1,
                              icon: Icon(
                                isVisible1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: AppColors.IconsBg,
                              ),
                            )

                          ],
                        ),

                        Visibility(
                          visible: isVisible1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2 , right:2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(onPressed: (){},

                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                      minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                      alignment: Alignment.centerLeft, // optional: left-aligns text
                                    ),
                                    child: Text('CPUs',style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: AppColors.quantityBar
                                    ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('GPUs',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Motherboards',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('RAM',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Storage',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Keyboards / Mice',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Phones container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                          color: AppColors.IconsBg,
                          width: 1
                      ))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0,right: 2,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phones & Tablets',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color:AppColors.IconsBg
                            ),),
                            IconButton(
                              onPressed: () => toggle2.state = !isVisible2,
                              icon: Icon(
                                isVisible2 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: AppColors.IconsBg,
                              ),
                            )

                          ],
                        ),

                        Visibility(
                          visible: isVisible2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2 , right:2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(onPressed: (){},

                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                      minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                      alignment: Alignment.centerLeft, // optional: left-aligns text
                                    ),
                                    child: Text('Smartphones',style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: AppColors.quantityBar
                                    ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Tablets',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Accessories',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Wearables',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Chargers',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Cables',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //laptop container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                          color: AppColors.IconsBg,
                          width: 1
                      ))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0,right: 2,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Laptops',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color:AppColors.IconsBg
                            ),),
                            IconButton(
                              onPressed: () => toggle3.state = !isVisible3,
                              icon: Icon(
                                isVisible3 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: AppColors.IconsBg,
                              ),
                            )

                          ],
                        ),

                        Visibility(
                          visible: isVisible3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2 , right:2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(onPressed: (){},

                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                      minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                      alignment: Alignment.centerLeft, // optional: left-aligns text
                                    ),
                                    child: Text('Gaming Laptops',style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: AppColors.quantityBar
                                    ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Business Laptops',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('2-in-1 Laptops',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Ultrabooks',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Chromebooks',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Laptop Accessories',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Address container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                          color: AppColors.IconsBg,
                          width: 1
                      ))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0,right: 2,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Address',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color:AppColors.IconsBg
                            ),),
                            IconButton(
                              onPressed: () => toggle4.state = !isVisible4,
                              icon: Icon(
                                isVisible4 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: AppColors.IconsBg,
                              ),
                            )

                          ],
                        ),

                        Visibility(
                          visible: isVisible4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2 , right:2,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(onPressed: (){},

                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                      minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                      alignment: Alignment.centerLeft, // optional: left-aligns text
                                    ),
                                    child: Text('Address: 1234 Street Adress City Address, 1234',style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: AppColors.quantityBar
                                    ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Phones: (00) 1234 5678',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('We are open: Monday-Thursday: 9:00 AM - 5:30 PM',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Friday: 9:00 AM - 6:00 PM',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Saturday: 10:00 AM - 4:00 PM',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                                TextButton(onPressed: (){},style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 5,bottom: 5), // ⬅️ removes the vertical (and horizontal) space
                                  minimumSize: Size(0, 0), // ⬅️ removes extra height constraint
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ⬅️ prevents extra padding from Material
                                  alignment: Alignment.centerLeft, // optional: left-aligns text
                                ), child: Text('Email: support@techstore.com',style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: AppColors.quantityBar
                                ),)),
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SvgPicture.asset('assets/icons/tabletcopyright.svg',
              width: double.infinity,
              ),
            )
          ],

        ),

      ),


    );
  }
}

