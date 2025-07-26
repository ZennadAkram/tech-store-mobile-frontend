import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final int reviewcount;

  const ProductCard({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.reviewcount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) {
                  print('Image load failed: $error');
                  return Icon(Icons.broken_image);
                },
                fadeInDuration: Duration(milliseconds: 200),
                fadeOutDuration: Duration(milliseconds: 200),
              )

                  : Center(child: Icon(Icons.image_not_supported, size: 60)),
            ),

            SizedBox(height: 10),
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
                  "Reviews (${reviewcount})",
                  style: TextStyle(fontSize: 14, color: AppColors.IconsBg),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("EX DISPLAY : MSI Pro 16 Flex-036AU 15.6 MULTITOUCH All-In-On..."+description, maxLines: 3, overflow: TextOverflow.ellipsis),
            SizedBox(height: 10),
            Text("\$${price.toStringAsFixed(2)}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough, color: AppColors.TextColor)),
            SizedBox(height: 10),
            Text("\$${price.toStringAsFixed(2)}", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,)),
            SizedBox(height: 10),


          ],
        ),
      ),
    );
  }
}
