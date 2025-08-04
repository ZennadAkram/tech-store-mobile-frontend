import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/cart/presentation/providers/providers.dart';
class InfosContainer extends ConsumerWidget {
  const InfosContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


   final countries=ref.read(cartViewModelProvider.notifier).countries;
    final toggle=ref.watch(toggleProvider);
    final toggle2=ref.watch(toggleProvider2);
    final selectedCountry = ref.watch(selectedCountryProvider);
    final controllerState = ref.read(cartViewModelProvider.notifier).controllerState;
    final controllerZipCode = ref.read(cartViewModelProvider.notifier).controllerZipCode;
    final selected = ref.watch(selectedStateProvider);
    final subTotal = ref.watch(subTotalProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 15),

      decoration: BoxDecoration(
        color: AppColors.grayBg,


      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Summary',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600

          ),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Estimate Shipping and Tax',style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400
              ),),

              IconButton(onPressed: (){
                ref.read(toggleProvider.notifier).state=!toggle;
              },icon: toggle ? Icon(Icons.keyboard_arrow_down_rounded,size: 23,) : Icon(Icons.keyboard_arrow_up_rounded,size: 23,))

            ]
          ),

          SizedBox(
            width:MediaQuery.of(context).size.width*0.7,

            child: Text('Enter your destination to get a shipping estimate.',style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.TextColor

            ),),
          ),
          SizedBox(height: 10,),
          Visibility(
              visible: !toggle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Country',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 10,),

                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                         filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.IconsBg
                              ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.IconsBg
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.IconsBg
                        ),
                      ),
                    ),
                    dropdownColor: Colors.white,

                    value: selectedCountry,
                    items: countries.map((String country) {
                      return DropdownMenuItem<String>(

                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      ref.read(selectedCountryProvider.notifier).state = value;
                    },
                  )

                    ]

                  ),
                  SizedBox(height: 10,),
                  Text('State/Province',style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: controllerState,
                    decoration: InputDecoration(
                      hintText: 'State/Province',
                      hintStyle: TextStyle(
                        color: AppColors.TextColor
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.IconsBg
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.IconsBg
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.IconsBg
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Zip/Postal Code',style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: controllerZipCode,
                    decoration: InputDecoration(
                      hintText: 'Zip/Postal Code',
                      hintStyle: TextStyle(
                          color: AppColors.TextColor
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.IconsBg
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.IconsBg
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.IconsBg
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,

                  activeColor: AppColors.blueComponents,

                  title: Text('Price may vary depending on the item/destination. Shop Staff will contact you. \$21.00',style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,

                  ),),
                  value: 'Option 1',
                  groupValue: selected,
                  onChanged: (value) {
                   ref.read(selectedStateProvider.notifier).state = value;
                  },
                ),
                RadioListTile<String>(
                  activeColor: AppColors.blueComponents,
                  contentPadding: EdgeInsets.zero,
                  title: Text('1234 Street Adress, City Address, 1234',style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,

                  )),
                  value: 'Option 2',
                  groupValue: selected,
                  onChanged: (value) {
                    ref.read(selectedStateProvider.notifier).state = value;
                  },
                ),
              ],
            )
                ],
                
              )

          ),
        SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Apply Discount Code',style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400
              ),),
              IconButton(onPressed: (){
                ref.read(toggleProvider2.notifier).state=!toggle2;
              },icon:Icon(toggle2 ? Icons.keyboard_arrow_down_rounded:Icons.keyboard_arrow_up_rounded,size: 23,) ,)
            ]
          ),
          SizedBox(height: 10,),
          Visibility(
            visible: !toggle2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter Discount code',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Discount code',
                    hintStyle: TextStyle(
                        color: AppColors.TextColor
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppColors.IconsBg
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppColors.IconsBg
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppColors.IconsBg
                      ),
                    ),
                  ),
                )


              ],
            )
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: 1
            ,
            color: AppColors.labelColor,

          ),
          SizedBox(height: 20,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text('Subtotal',style: TextStyle(
               fontSize: 13,
               fontWeight: FontWeight.w600
             ),),
             Text('\$${subTotal.toStringAsFixed(2)}',style: TextStyle(
               fontSize: 13,
               fontWeight: FontWeight.w600
             ),)
           ],

         ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Shipping',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),),
              Text('\$21',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),)
            ],

          ),
          SizedBox(height: 25,),
          Text('(Standard Rate - Price may vary depending on the item/destination. Shop Staff will contact you.)',style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.IconsBg

          )),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Tax',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),),
              Text('\$21.00',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),)
            ],

          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('GST (10%)',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),),
              Text('\$21.00',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),)
            ],

          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Order Total',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),),
              Text('\$21.00',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),)
            ],

          ),
          SizedBox(height: 25,),
          ElevatedButton(onPressed: (){},

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueComponents,
              minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Proceed to Checkout',style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,

            color: Colors.white
          ),)),
          SizedBox(height: 25,),
          ElevatedButton(onPressed: (){},

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellowPaypal,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text('Proceed to Checkout',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,

                      color: AppColors.textBlue
                  ),),
                  SizedBox(width: 12,),
                  SvgPicture.asset('assets/icons/paypal.svg',height: 25,width: 25,)


                ],
              )),
          SizedBox(height: 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/zip.svg',height: 25,width: 25,),
            ],
          )
        ],


      )
    );
  }
}
