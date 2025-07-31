import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/product_detail_providers.dart';
class PictureAndLike extends ConsumerWidget {
  final ProductDetailed product;
  const PictureAndLike({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVersion = ref.watch(currentVersionProvider);
    final liked=ref.watch(likedColorProvider);
    final currentImage = ref.watch(currentImageProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child:  Row(
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
                width: screenWidth*0.3,
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
    );
  }
}
