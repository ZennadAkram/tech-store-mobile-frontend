import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/product_detail_providers.dart';
class DescTablet extends ConsumerWidget {
  final ProductDetailed product;
  const DescTablet({super.key,required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVersion = ref.watch(currentVersionProvider);
    final currentColor = ref.watch(currentColorProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: 400,
      padding: EdgeInsets.only(left: 25,right: 25,top: 16,bottom: 16),
      decoration: BoxDecoration(
      color: AppColors.grayBg

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 20,),
          Text(product.name,style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(height: 20,),

          Expanded(
            child: TabBarView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.description+"MSI MPG Trident 3 10SC-005AU Intel i7 10700F, 2060 SUPER, 16GB RAM, 512GB SSD, 2TB HDD, Windows 10 Home, Gaming Keyboard and Mouse 3 Years Warranty Gaming Desktop",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),),
                    SizedBox(height: 20,),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(product.versions!.length, (index) {

                        return ElevatedButton(onPressed: () {
                          ref.read(currentVersionProvider.notifier).state=index;
                          ref.read(currentColorProvider.notifier).state=0;
                          ref.read(currentImageProvider.notifier).state=0;
                        },

                          child: Text(product.versions![index].storage_capacity,style: TextStyle(
                            color:index==currentVersion ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            backgroundColor:index==currentVersion ? Colors.black : Colors.white,
                          ),

                        );
                      }


                      ),),
                    SizedBox(height: 20,),
                    Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(product.versions![currentVersion].colors!.length, (index) {


                          return GestureDetector(
                              onTap: (){
                                ref.read(currentColorProvider.notifier).state=index;
                              },
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(

                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: index==currentColor ? AppColors.blueComponents : Colors.white,
                                    width: 2.5,
                                  ),),
                                child: Container(

                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(

                                      shape: BoxShape.circle,
                                      color:Color(int.parse('FF${product.versions![currentVersion].colors![index].code.substring(1)}',radix: 16)),
                                    )),
                              )

                          );
                        }
                        )),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(product.versions![currentVersion].features!.length, (index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '• ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(product.versions![currentVersion].features![index].value
                                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,)),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      );
                    })

                ),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(product.versions![currentVersion].features!.length, (index) {
                      return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: index.isEven ? Colors.white : AppColors.grayBg,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(product.versions![currentVersion].features![index].title,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  Text(product.versions![currentVersion].features![index].value,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),)
                                ],
                              ),
                            )
                          ]
                      );
                    },
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
