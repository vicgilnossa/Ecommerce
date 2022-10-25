import 'package:ecommerce_cbd/models/models.dart';
import 'package:ecommerce_cbd/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class ButtonNavbar extends StatelessWidget {
  const ButtonNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOption;
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 18,
          unselectedItemColor: const Color(0xff9FA5B4),
          selectedItemColor: const Color(0xffA3B484),
          onTap: (int i) => uiProvider.selectedMenuOpt = i,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house), label: ""),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.compass), label: ""),
            BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: () {
                      productsService.selectedProduct = Product(
                          name: "",
                          overview: "",
                          price: 0,
                          picture:
                              "https://latarta.com.co/wp-content/uploads/2018/06/default-placeholder.png");
                      Navigator.pushNamed(context, "editproduct");
                    },
                    child: FaIcon(FontAwesomeIcons.squarePlus)),
                label: ""),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.bagShopping), label: ""),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidUser), label: ""),
          ]),
    );
  }
}
