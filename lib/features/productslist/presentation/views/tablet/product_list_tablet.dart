import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';
import 'package:tech_store/features/productslist/presentation/viewmodels/providers.dart';
import 'package:tech_store/features/productslist/presentation/widgets/brand_card.dart';
import 'package:tech_store/features/productslist/presentation/widgets/product_card.dart';
import 'package:tech_store/features/productslist/presentation/widgets/product_list_view.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';

import 'package:tech_store/shared/widgets/help_and_support.dart';

class ProductListScreenTablet extends ConsumerStatefulWidget {
  const ProductListScreenTablet({super.key});

  @override
  ConsumerState<ProductListScreenTablet> createState() => _ProductListScreenTabletState();
}

class _ProductListScreenTabletState extends ConsumerState<ProductListScreenTablet> {
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
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreProducts();
    } else {
      setState(() {
        showHelpAndSupport = true;
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
    final screenSize = MediaQuery.of(context).size;
    final selectedValue = ref.watch(productFilterProvider);
    final priceRanges = ref.watch(priceRangesProvider);
    final categoryCounts = ref.watch(categoryCountsProvider);
    final filtersNumber = ref.watch(filtersNumberProvider);
    final brand = ref.watch(brandsProvider);
    final brandtogle = ref.watch(togglebrand);
    final colortogle = ref.watch(togglecolor);
    final pricetogle = ref.watch(toggleprice);
    final categorytogle = ref.watch(togglcategory);
    final gridOrList=ref.watch(listOrGridProvider);

    final List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem(value: 'All', child: Text('All')),
      const DropdownMenuItem(value: 'created_at', child: Text('Newest')),
      const DropdownMenuItem(value: 'starting_price', child: Text('Price: Low to High')),
      const DropdownMenuItem(value: '-starting_price', child: Text('Price: High to Low')),
      const DropdownMenuItem(value: 'average_rating', child: Text('Rating: High to Low')),
      const DropdownMenuItem(value: '-average_rating', child: Text('Rating: Low to High')),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
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
                    SvgPicture.asset('assets/icons/logo.svg'),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, size: 30),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // ... (keep your existing drawer items)
            ],
          ),
        ),
      ),
      appBar: AppBarCostume(),
      body: productsState.when(
        error: (er, st) => Center(child: Text(er.toString())),
        loading: () => Center(child: CircularProgressIndicator(color: AppColors.blueComponents)),
        data: (List<Product> products) {
          final isLoadingMore = ref.read(productViewModelProvider.notifier).isLoadingMore;

          return Column(
            children: [
              // Header Section
              Padding(
                padding:  EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Products (${products.length})',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Container(
                          width: screenSize.width * 0.2,
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
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: DropdownButton<String>(
                                value: selectedValue,
                                isExpanded: true,
                                items: items,
                                onChanged: (value) {
                                  if (value != null) {
                                    ref.read(productFilterProvider.notifier).state = value;
                                    ref.read(productViewModelProvider.notifier).applyFilters(
                                      {
                                        'category': ref.read(categoryFilterProvider),
                                        'price_range': ref.read(priceFiltersProvider),
                                        'brand': ref.read(brandFilterProvider),
                                      },
                                      {'ordering': value},
                                    );
                                  }
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
                          ),
                        ),
                        const SizedBox(width: 16),

                        InkWell(
                            onTap: (){
                              ref.read(listOrGridProvider.notifier).state=!gridOrList;
                            },
                            child: !gridOrList ? SvgPicture.asset('assets/icons/grid.svg'):SvgPicture.asset('assets/icons/grid2.svg')),
                        const SizedBox(width: 16),
                        InkWell(
                            onTap: (){
                              ref.read(listOrGridProvider.notifier).state=!gridOrList;
                            },
                            child: !gridOrList ? SvgPicture.asset('assets/icons/list.svg'):SvgPicture.asset('assets/icons/list2.svg')),
                      ],
                    ),
                  ],
                ),
              ),
              // Main Content Area
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Filters Panel
                    Container(
                      width: screenSize.width * 0.28,
                      color: AppColors.grayBg,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Filters',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  ref.read(filtersNumberProvider.notifier).state = 0;
                                  ref.read(categoryFilterProvider.notifier).state = '';
                                  ref.read(priceFiltersProvider.notifier).state = '';
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50),
                                  backgroundColor: AppColors.grayBg,
                                  side: BorderSide(
                                    color: AppColors.IconsBg,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  'Clear Filter',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.IconsBg,
                                  ),
                                ),
                              ),
                              // Category Filter
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Category', style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )),
                                  IconButton(
                                    onPressed: () => ref.read(togglcategory.notifier).state = !categorytogle,
                                    icon: Icon(!categorytogle ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                                  ),
                                ],
                              ),
                              if (categorytogle)
                                Column(
                                  children: categoryCounts.map((category) => Padding(
                                    padding: const EdgeInsets.only(right: 18, bottom: 10),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (ref.read(categoryFilterProvider.notifier).state.isEmpty) {
                                            ref.read(filtersNumberProvider.notifier).state++;
                                          }
                                          ref.read(categoryFilterProvider.notifier).state = category.name;
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(category.name),
                                            Text(category.product_count.toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )).toList(),
                                ),
                              // Price Filter
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Price', style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )),
                                  IconButton(
                                    onPressed: () => ref.read(toggleprice.notifier).state = !pricetogle,
                                    icon: Icon(!pricetogle ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                                  ),
                                ],
                              ),
                              if (pricetogle)
                                Column(
                                  children: priceRanges.map((range) => Padding(
                                    padding: const EdgeInsets.only(right: 18, bottom: 10),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (ref.read(priceFiltersProvider.notifier).state.isEmpty) {
                                            ref.read(filtersNumberProvider.notifier).state++;
                                          }
                                          ref.read(priceFiltersProvider.notifier).state = range.range;
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(ref.read(priceFormatterProvider)(range.range)),
                                            Text(range.count.toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )).toList(),
                                ),

                              // Apply Filters Button
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 30),
                                child: ElevatedButton(
                                  onPressed: () {
                                    ref.read(productViewModelProvider.notifier).applyFilters(
                                      {
                                        'category': ref.read(categoryFilterProvider),
                                        'price_range': ref.read(priceFiltersProvider),
                                        'brand': ref.read(brandFilterProvider),
                                      },
                                      {'ordering': ref.read(productFilterProvider)},
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(double.infinity, 50),
                                    backgroundColor: AppColors.blueComponents,
                                  ),
                                  child: Text(
                                    'Apply Filters ($filtersNumber)',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                              ),
                              Container(
                                color: Colors.white,
                                height: 10,
                                width: double.infinity,

                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('Brands', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    )),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: brand.length,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.8,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 0,
                                      ),
                                      itemBuilder: (BuildContext context, int index) {
                                        final currentBrand = brand[index];
                                        return InkWell(
                                          onTap: (){
                                            if(ref.read(brandFilterProvider.notifier).state ==''){
                                              ref.read(filtersNumberProvider.notifier).state++;
                                            }
                                            ref.read(brandFilterProvider.notifier).state=currentBrand.name;
                                          },
                                          child: BrandCard(
                                            brand: currentBrand.name,
                                            imageUrl: currentBrand.brandImage ?? '', // fallback to empty string if null
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                ],

                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Products Grid
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollEndNotification &&
                              _scrollController.position.pixels ==
                                  _scrollController.position.maxScrollExtent) {
                            _loadMoreProducts();
                          }
                          return false;
                        },
                        child:gridOrList ? GridView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio:2/4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: products.length + (isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index >= products.length) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            final product = products[index];
                            return ProductCard(
                              key: ValueKey(product.id),
                              id: product.id ?? 0,
                              name: product.name ?? '',
                              price: product.startingPrice ?? 0,
                              imageUrl: product.imageUrl ?? '',
                              rating: product.averageRating ?? 0,
                              description: product.description ?? '',
                              reviewcount: product.reviewCount ?? 0,
                            );
                          },
                        ):ProductListView(products: products),
                      ),
                    ),
                  ],
                ),
              ),
              // Help & Support Section
              if (showHelpAndSupport) const HelpAndSupport(),
            ],
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}