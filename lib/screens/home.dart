import 'package:ecommerce_cbd/screens/add_product.dart';
import 'package:ecommerce_cbd/screens/edit_product.dart';
import 'package:ecommerce_cbd/screens/main.dart';
import 'package:ecommerce_cbd/screens/show_product.dart';
import 'package:ecommerce_cbd/services/services.dart';
import 'package:ecommerce_cbd/widgets/button_navbar.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_cbd/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(height: 60, child: ButtonNavbar()),
        backgroundColor: Color(0xffF1F1F4),
        body: _HomePageBody(),
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOption;
    switch (currentIndex) {
      case 0:
        return const MainScreen();

      case 1:
        return const ShowProductScreen();

      case 3:
        return const AddProductScreen();

      default:
        return const MainScreen();
    }
  }
}
