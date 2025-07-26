import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/products-details/data/datasources/remote/remote_api_impl.dart';
import 'package:tech_store/features/productslist/presentation/views/product_list.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  final productService = ProductsDetailRemoteDataImpl();

  try {
    final products = await productService.getProductDetail(21);

      print('❌❌❌${products.name} - ❌❌❌${products.poster_image?? "No image"}');



  } catch (e) {
    print("❌ Error: $e");
  }
  print(dotenv.env['BASE_URL']); // Should print your URL

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductList(),
    );
  }
}

