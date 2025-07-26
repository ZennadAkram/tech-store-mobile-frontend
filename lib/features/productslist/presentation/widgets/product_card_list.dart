import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';
class ProductCardList extends StatelessWidget {
  final Product product;
  const ProductCardList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final rating =product.averageRating ?? 0.0;
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Padding(padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl: product.imageUrl ??'',
                  width: 250,

                  fit: BoxFit.contain,

                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.broken_image),
                  fadeInDuration: Duration(milliseconds: 200),
                  fadeOutDuration: Duration(milliseconds: 200),

                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Stars
                    for (int i = 1; i <= 5; i++)

                      Icon(
                        i <= rating
                            ? Icons.star
                            : (i - rating < 1 && i - rating > 0)
                            ? Icons.star_half
                            : Icons.star,

                        color:i <= rating ? Colors.amber:AppColors.labelColor,
                        size: 18,
                      ),
                    SizedBox(width: 6),
                    // Numeric rating and review count
                    Text(
                      "Reviews (${product.reviewCount})",
                      style: TextStyle(fontSize: 14, color: AppColors.IconsBg),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(width: 35,),
            SizedBox(
              width: 200,

              child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(product.name ?? '',style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.w300,
                   ),),
                   SizedBox(height: 10,),
                   Text( "MSI CREATOR 17 A10SFS-240AU 17 UHD 4K HDR Thin Bezel Intel 10th Gen i7 10875H - RTX 2070 SUPER MAX Q - 16GB RAM - 1TB SSD NVME - Windows 10 PRO Laptop"

                       ,overflow: TextOverflow.ellipsis,maxLines: 5,
                     style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.w400,
                     )
                   ),
                   SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text("\$${product.startingPrice?.toStringAsFixed(2)}",style: TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.w400,
                         decoration: TextDecoration.lineThrough

                       )),
                       SizedBox(width: 10,),
                       Text("\$${product.startingPrice?.toStringAsFixed(2)}",style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.w700,

                       )),

                     ]

                   ),
                   SizedBox(height: 40,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       ElevatedButton(onPressed: (){}, child:Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Row(children: [
                           Icon(Icons.shopping_cart_outlined
                             ,

                             color: AppColors.blueComponents,
                           size: 25,
                           ),
                           SizedBox(width: 5,),
                           Text('Add To Cart',style: TextStyle(
                             color: AppColors.blueComponents,
                             fontSize: 15,
                             fontWeight: FontWeight.w600,
                           ),),

                         ],),
                       ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                              color: AppColors.blueComponents,
                              width: 2.5,
                            ),
                          )
                        ),
                       )
                     ],
                   )

                 ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
