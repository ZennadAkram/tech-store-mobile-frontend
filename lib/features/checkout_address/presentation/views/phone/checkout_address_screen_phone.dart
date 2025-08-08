import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/auth/presentation/widgets/drawer.dart';
import 'package:tech_store/features/cart/presentation/widgets/external/cart_checkout.dart';
import 'package:tech_store/features/checkout_address/domain/entities/address.dart';
import 'package:tech_store/features/checkout_address/presentation/providers/provider.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';
import 'package:tech_store/shared/widgets/help_and_support.dart';
class CheckoutAddressScreenPhone extends ConsumerWidget {
  const CheckoutAddressScreenPhone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm=ref.read(addressViewModelProvider.notifier);
    final selected=ref.watch(selectedProvider);

    return Scaffold(
      appBar: AppBarCostume(),
      drawer: DrawerCostume(),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
           Padding(
             padding: const EdgeInsets.only(left: 15.0,right: 15,top: 25),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
        Text('Checkout',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,

        ),),
                 SizedBox(height: 40,),

                 Container(
                   padding: EdgeInsets.only(bottom: 12),
                   width: double.infinity,
                   decoration: BoxDecoration(
                     border: Border(
                       bottom: BorderSide(color: AppColors.labelColor,width: 1)
                     )
                   ),
                   child: Text('Shipping Address',style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w600,
                   ),

                   ),

                 ),
                 SizedBox(height: 25,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('Email Address',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                         ,),
                         Text('*',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                           color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                      TextFormField(
                        controller: vm.emailController,
                        decoration: InputDecoration(
                          filled: true,
                           fillColor: Colors.white,
                           hintText: 'Enter Email',
                           hintStyle: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w300,
                           ),
                           enabledBorder:  OutlineInputBorder(
                               borderRadius: BorderRadius.circular(4),
                               borderSide: BorderSide(
                                 color: AppColors.IconsBg,

                                 width: 1,
                               )
                           ),

                           focusedBorder:  OutlineInputBorder(
                               borderRadius: BorderRadius.circular(4),
                               borderSide: BorderSide(
                                 color: AppColors.IconsBg,

                                 width: 1,
                               )
                           ),

                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(4),
                             borderSide: BorderSide(
                               color: AppColors.IconsBg,

                               width: 1,
                           )
                      ))),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('First Name',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                           ,),
                         Text('*',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w600,
                             color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                     TextFormField(
                         controller: vm.firstNameController,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Enter First Name',
                             hintStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w300,
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ))),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('Last Name',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                           ,),
                         Text('*',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w600,
                             color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                     TextFormField(
                         controller: vm.lastNameController,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Enter Last Name',
                             hintStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w300,
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ))),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('Street Address',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                           ,),
                         Text('*',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w600,
                             color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                     TextFormField(
                         controller: vm.addressController,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Enter Street Address',
                             hintStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w300,
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ))),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('City',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                           ,),
                         Text('*',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w600,
                             color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                     TextFormField(
                         controller: vm.cityController,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Enter City',
                             hintStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w300,
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ))),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('State/Province',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                           ,),
                         Text('*',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w600,
                             color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                     TextFormField(
                         controller: vm.stateController,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Enter State/Province',
                             hintStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w300,
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ))),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('Zip/Postal Code',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                           ,),
                         Text('*',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w600,
                             color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                     TextFormField(
                         controller: vm.zipController,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Enter Zip/Postal Code',
                             hintStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w300,
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ))),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('Country',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                           ,),
                         Text('*',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w600,
                             color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                     TextFormField(
                         controller: vm.countryController,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Enter Country',
                             hintStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w300,
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ))),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text('Phone Number',style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w600,
                         )
                           ,),
                         Text('*',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w600,
                             color: Colors.red
                         )
                           ,),

                       ],
                     ),
                     SizedBox(height: 5,),
                     TextFormField(
                         controller: vm.phoneController,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: 'Enter Phone Number',
                             hintStyle: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w300,
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ),

                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4),
                                 borderSide: BorderSide(
                                   color: AppColors.IconsBg,

                                   width: 1,
                                 )
                             ))),
                   ],
                 ),
                 SizedBox(height: 20,),
                 Container(
                   margin: EdgeInsets.only(top: 12,bottom: 12),
                   width: double.infinity,
                   decoration: BoxDecoration(
                       border: Border(
                           bottom: BorderSide(color: AppColors.labelColor,width: 1)
                       )
                   ),
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text('Standard Rate',style: TextStyle(
                       fontSize: 13,
                       fontWeight: FontWeight.w600,
                     )

                     ),
                     RadioListTile<String>(
                       contentPadding: EdgeInsets.zero,

                       activeColor: AppColors.blueComponents,

                       title: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: MediaQuery.of(context).size.width*0.5,
                             child: Text('Price may vary depending on the item/destination. Shop Staff will contact you',style: TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.w400,

                             ),),
                           ),
                           Text('\$21.00',style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w600,

                           ),),
                         ],
                       ),
                       value: 'Option 1',
                       groupValue: selected,
                       onChanged: (value) {
                         ref.read(selectedProvider.notifier).state = value;
                       },
                     ),
                     SizedBox(height: 20,),
                     Text('Pickup from store',style: TextStyle(
                       fontSize: 13,
                       fontWeight: FontWeight.w600,
                     )

                     ),
                     RadioListTile<String>(
                       activeColor: AppColors.blueComponents,
                       contentPadding: EdgeInsets.zero,
                       title: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: MediaQuery.of(context).size.width*0.5,

                             child: Text('1234 Street Adress, City Address, 1234',style: TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.w400,

                             )),

                           ),
                           Text('\$0.00',style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w600,

                           ),),
                         ],
                       ),
                       value: 'Option 2',
                       groupValue: selected,
                       onChanged: (value) {
                         ref.read(selectedProvider.notifier).state = value;
                       },
                     ),
                   ],
                 ),
                 SizedBox(height: 20,),
                 ElevatedButton(
                   onPressed: () {
                    vm.updateOrCreateAddress(Address(
                      id:vm.id,
                      email: vm.emailController.text,
                      first_name: vm.firstNameController.text,
                      last_name: vm.lastNameController.text,
                      phone_number: vm.phoneController.text,
                      street_address: vm.addressController.text,
                      city: vm.cityController.text,
                      state: vm.stateController.text,
                      postal_code: vm.zipController.text,
                      country: vm.countryController.text,
                      address_type: vm.addressTypeController.text,

                    ));
                   },
                   child: Text('Next',style: TextStyle(
                     fontSize: 14,
                     fontWeight: FontWeight.w600,
                     color: Colors.white
                   ),),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: AppColors.blueComponents,
                     padding: EdgeInsets.only(left: 50,right: 50)
                   ),
                 ),
                 SizedBox(height: 20,),
                 CartCheckout()

               ],
             ),
           ),
            HelpAndSupport()

          ],
        ),
      ) ,
    );
  }
}
