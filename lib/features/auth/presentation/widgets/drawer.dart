import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
class DrawerCostume extends StatelessWidget {
  const DrawerCostume({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
