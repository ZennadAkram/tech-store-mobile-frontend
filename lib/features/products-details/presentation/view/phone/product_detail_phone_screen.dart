import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/product_detail_providers.dart';
import 'package:tech_store/features/products-details/presentation/widgets/add_to_cart_container.dart';
import 'package:tech_store/features/products-details/presentation/widgets/features_images.dart';
import 'package:tech_store/features/products-details/presentation/widgets/tab_bars_and_desc.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';
import 'package:tech_store/shared/widgets/help_and_support.dart';
class ProductDetailScreenPhone extends ConsumerWidget {
  const ProductDetailScreenPhone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVersion = ref.watch(currentVersionProvider);
    final liked=ref.watch(likedColorProvider);
    final currentImage = ref.watch(currentImageProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final products = ref.watch(productDetailViewModelProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.only( top: 30),
              child: Column(
                children: [
                  Container(


                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                          width: 1,
                          color: AppColors.labelColor
                      )),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/logo.svg',),
                        IconButton(onPressed: (){Navigator.pop(context);},

                            icon: Icon(Icons.close,size: 30,))
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(

                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      alignment: Alignment.centerLeft, // 👈 this is enough!
                    ),
                    child: Text('Phones & Tablets',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.black),),
                  ),
                  SizedBox(height: 0,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(

                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      alignment: Alignment.centerLeft, // 👈 this is enough!
                    ),
                    child: Text('Laptops',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.black),),
                  ),
                  SizedBox(height: 0,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(

                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      alignment: Alignment.centerLeft, // 👈 this is enough!
                    ),
                    child: Text('Networking Devices',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.black),),
                  ),
                  SizedBox(height: 0,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(

                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      alignment: Alignment.centerLeft, // 👈 this is enough!
                    ),
                    child: Text('Printers & Scanners',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.black),),
                  ),
                  SizedBox(height: 0,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(

                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      alignment: Alignment.centerLeft, // 👈 this is enough!
                    ),
                    child: Text('PC Parts',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.black),),
                  ),
                  SizedBox(height: 0,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(

                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      alignment: Alignment.centerLeft, // 👈 this is enough!
                    ),
                    child: Text('Desktops',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.black),),
                  ),
                  SizedBox(height: 0,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(

                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      alignment: Alignment.centerLeft, // 👈 this is enough!
                    ),
                    child: Text('All Other Products',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.black),),
                  ),
                ],
              ),
            ),
          ),

        appBar: AppBarCostume(),
        body: products.when(data:(ProductDetailed product)=>SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20,left: 14,right: 14),
                child: Column(
                   children: [
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Container(
                           decoration: BoxDecoration(
                             color:ref.read(likedColorProvider) ? Colors.red :Colors.white,
                             borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color:liked ? Colors.red:AppColors.IconsBg,
                              width: 3
                            )
                           ),
                           child: IconButton(

                               onPressed: (){
                                 ref.watch(likedColorProvider);
                                 ref.read(likedColorProvider.notifier).state=!ref.read(likedColorProvider.notifier).state;
                               },

                               icon: Icon(LucideIcons.heart,
                                 color:liked ? Colors.white :AppColors.IconsBg,size: 30,)),
                         ),
                         SizedBox(width:10,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,

                           children: [
                             product.versions!.isNotEmpty ?
                            SizedBox(
                              width: screenWidth*0.6,
                              height: 250,
                              child: PageView.builder(
                                onPageChanged: (index) {
                                  ref.read(currentImageProvider.notifier).state=index;
                                },
                                itemCount: product.versions?[currentVersion].images?.length,
                                itemBuilder: (BuildContext context, int index) {


                                  return  CachedNetworkImage(imageUrl: product.versions?[currentVersion].images![currentImage].image ?? "",
                                    width: screenWidth*0.6,
                                    height: 250,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),

                                    errorWidget: (context, url, error) => Icon(Icons.broken_image),
                                  );
                                },),

                            ): CachedNetworkImage(imageUrl: product.poster_image,
                        width: screenWidth*0.6,

                        placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(), // 👈 loading widget here
                        ),

                        errorWidget: (context, url, error) => Icon(Icons.broken_image),
                      ),

                             SizedBox(height: 20,),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: List.generate(product.versions![currentVersion].images!.length, (index) {
                                 final currentIndex = ref.watch(currentImageProvider);

                                 return Container(
                                   margin: const EdgeInsets.symmetric(horizontal: 4),
                                   width: 20,
                                   height: 20,
                                   decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     color: index == currentIndex ? AppColors.blueComponents : AppColors.IconsBg,

                                   ),

                                 );
                               }),
                             ),

                             SizedBox(height: 20,),
                             SvgPicture.asset('assets/icons/zip.svg'),

                           ],

                         ),

                       ],
                     ),
                     SizedBox(height: 20,),
                     SizedBox(
                         height: 380,
                         child: TabBarsAndDesc(product: product)),
                     SizedBox(height: 20,),





                   ],
                ),
              ),
              AddToCartContainer(product),

              Visibility(
                visible: product.versions![currentVersion].features!.isNotEmpty,
                child: FeaturesImages(features: product.versions![currentVersion].features ?? []),
              ),
              HelpAndSupport(),


            ],
          ),
        ) , error: (er,st)=>Center(child: Text('Failed to load product'),), loading:()=>Center(child: CircularProgressIndicator(),) ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
