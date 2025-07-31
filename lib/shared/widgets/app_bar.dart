import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
 // ✅ Use this, not Provider
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/shared/providers/appbar_provider.dart';

class AppBarCostume extends HookConsumerWidget implements PreferredSizeWidget {
  const AppBarCostume({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(170);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userVM = ref.watch(appBarUserProvider);

    // Run once to initialize data
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(appBarUserProvider).initializeData();
      });
      return null;
    }, []);

    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 135,
          width: double.infinity,
          color: AppColors.blueComponents,
          child: Padding(
            padding: const EdgeInsets.only(top: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.menu, size: 35, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                Container(
                  width: screenWidth * 0.6,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here",
                      prefixIcon: Icon(Icons.search_rounded,
                          size: 30, color: AppColors.labelColor),
                      hintStyle: TextStyle(
                          color: AppColors.ChipChoice,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/cart.svg',
                            width: 32,
                            height: 32,
                          ),
                        ),
                        if (userVM.cartCount > 0)
                          Positioned(
                            left: 25,
                            top: -1,
                            child: Container(
                              height: 17,
                              width: 17,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text('${userVM.cartCount}',
                                    style: TextStyle(
                                        color: AppColors.blueComponents,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: userVM.user.image == null || userVM.user.isEmpty
                          ? SvgPicture.asset('assets/icons/profileicon.svg',
                          width: 32, height: 32)
                          : ClipOval(
                          child: Image.network(userVM.user.image!,
                              width: 32, height: 32)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(height: 50, color: Colors.black),
        ),
        Positioned(
          top: 0,
          left: 30,
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.blueComponents,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.layers_rounded,
                  color: Colors.white, size: 35),
            ),
          ),
        ),
      ],
    );
  }
}
