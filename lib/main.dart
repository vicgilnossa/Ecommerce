import 'package:ecommerce_cbd/providers/ui_provider.dart';
import 'package:ecommerce_cbd/screens/add_product.dart';
import 'package:ecommerce_cbd/screens/edit_product.dart';
import 'package:ecommerce_cbd/screens/show_product.dart';
import 'package:ecommerce_cbd/services/services.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_cbd/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home": (_) => const HomeScreen(),
        "productdetail": (_) => const ProductDetailScreen(),
        "addproduct": (_) => const AddProductScreen(),
        "editproduct": (_) => const EditProductScreen(),
        "showproduct": (_) => const ShowProductScreen(),
      },
      theme: ThemeData(
          textTheme: TextTheme(
        subtitle1: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: const Color(0xff9FA5B4)),
        bodyText1: GoogleFonts.poppins(
            
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: const Color(0xff313C58)),
        bodyText2: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: const Color(0xffFFA05B)),
        caption: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: const Color(0xff313C58)),
        overline: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: const Color(0xffFFA05B)),
      )),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
