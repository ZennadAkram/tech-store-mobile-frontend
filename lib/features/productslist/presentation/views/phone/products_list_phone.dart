import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';
import 'package:tech_store/features/productslist/presentation/viewmodels/providers.dart';
import 'package:tech_store/features/productslist/presentation/widgets/product_card.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';
import 'package:tech_store/shared/widgets/help_and_support.dart';

class ProductsListScreen extends ConsumerStatefulWidget {
  const ProductsListScreen({super.key});

  @override
  ConsumerState<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends ConsumerState<ProductsListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();
   bool showHelpAndSupport = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreProducts();
    }else{
setState(() {
  showHelpAndSupport=true;
});
    }
  }

  Future<void> _loadMoreProducts() async {
    final viewModel = ref.read(productViewModelProvider.notifier);
    if (viewModel.hasMore && !viewModel.isLoadingMore) {
      await viewModel.fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(productViewModelProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final selectedValue = ref.watch(productFilterProvider);
    final selectedNotifier = ref.read(productFilterProvider.notifier);
    final brandtogle=ref.watch(togglebrand);
    final colortogle=ref.watch(togglecolor);
    final pricetogle=ref.watch(toggleprice);
    final categorytogle=ref.watch(togglcategory);
    final priceRanges = ref.watch(priceRangesProvider);
     final categoryCounts = ref.watch(categoryCountsProvider);


    final List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem(value: 'All', child: Text('All')),
      const DropdownMenuItem(value: 'Newest', child: Text('Newest')),
      const DropdownMenuItem(value: 'Price: Low to High', child: Text('Price: Low to High')),
      const DropdownMenuItem(value: 'Price: High to Low', child: Text('Price: High to Low')),
    ];

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 50),
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
                Text('Filter By',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),),
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close,size: 30,)),
              ],
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Category',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black


                ),),

                IconButton(onPressed: (){
                  ref.read(togglcategory.notifier).state=!categorytogle;
                },icon: Icon(!categorytogle ? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_outlined,color: Colors.black,)),
              ],
            ),
            Visibility(
              visible: categorytogle,
              child: Column(
                children: List.generate(categoryCounts.length, (index) {

                  return Padding(
                    padding: const EdgeInsets.only(right: 18,bottom: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(categoryCounts[index].name, style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            )),
                            Text(categoryCounts[index].product_count.toString(), style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Price',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black


                ),),

                IconButton(onPressed: (){
                  ref.read(toggleprice.notifier).state=!pricetogle;
                },icon: Icon(!pricetogle ? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_outlined,color: Colors.black,)),
              ],
            ),

            Visibility(
              visible: pricetogle,
              child: Column(
                children: List.generate(priceRanges.length, (index) {
                  final formatPrice = ref.read(priceFormatterProvider);
                  return Padding(
                    padding: const EdgeInsets.only(right: 18,bottom: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatPrice(priceRanges[index].range), style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            )),
                            Text(priceRanges[index].count.toString(), style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Color',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black


                ),),

                IconButton(onPressed: (){
                  ref.read(togglecolor.notifier).state=!colortogle;
                },icon: Icon(!colortogle ? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_outlined,color: Colors.black,)),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Brands',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black


                ),),

                IconButton(onPressed: (){
                  ref.read(togglebrand.notifier).state=!brandtogle;
                },icon: Icon(!brandtogle ? Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_outlined,color: Colors.black,)),
              ],
            ),
            SizedBox(height: 5,),
            //GET http://localhost:8000/api/category-product-count/
            // ###
            // GET http://localhost:8000/api/products-price-count/?ranges=0-50,51-100,101-200

          ],
        ),
        )
      ),

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
      body: productsState.when(
        error: (er, st) => Center(child: Text(er.toString())),
        loading: () => Center(child: CircularProgressIndicator(color: AppColors.blueComponents)),
        data: (List<Product> products) {
          final isLoadingMore = ref.watch(productViewModelProvider.notifier).isLoadingMore;

          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header section
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Products (${products.length})',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () { _scaffoldKey.currentState?.openEndDrawer();},
                                  child: Text(
                                    'Filter',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(screenWidth * 0.44, 50),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.44,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 0,
                                        blurRadius: 2,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Sort by:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.IconsBg,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Flexible(
                                            child: DropdownButton<String>(
                                              value: selectedValue,
                                              isExpanded: true,
                                              items: items,
                                              onChanged: (value) {
                                                selectedNotifier.state = value!;
                                              },
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                              icon: const Icon(Icons.arrow_drop_down),
                                              dropdownColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // GridView section
                      SizedBox(
                        height: constraints.maxHeight * 0.9, // Adjust this value as needed
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            if (scrollNotification is ScrollEndNotification &&
                                _scrollController.position.pixels ==
                                    _scrollController.position.maxScrollExtent) {
                              _loadMoreProducts();
                            }
                            return false;
                          },
                          child: GridView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.8 / 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: products.length + (isLoadingMore ? 1 : 0),
                            itemBuilder: (BuildContext context, int index) {
                              if (index >= products.length) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: CircularProgressIndicator(
                                      color: AppColors.blueComponents,
                                    ),
                                  ),
                                );
                              }

                              final product = products[index];
                              return ProductCard(
                                id: product.id ?? 0,
                                name: product.name ?? '',
                                price: product.startingPrice ?? 0,
                                imageUrl: product.imageUrl ?? 'https://mdsmobile.ae/cdn/shop/files/sm-s938_galaxys25ultra_front_titaniumblack_241107_8281b0d7-c0ef-403f-b7bf-a202e6e5da58.png?v=1751351292',
                                rating: product.averageRating ?? 0,
                                description: product.description ?? '',
                                reviewcount: product.reviewCount ?? 0,
                              );
                            },
                          ),
                        ),
                      ),
                      // HelpAndSupport section

                       const HelpAndSupport(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}