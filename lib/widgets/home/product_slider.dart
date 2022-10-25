import 'package:ecommerce_cbd/models/product.dart';
import 'package:ecommerce_cbd/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/product_services.dart';

class HomeProductSlider extends StatelessWidget {
  const HomeProductSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);
    return Container(
      width: double.infinity,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 15),
            child: Text(
              "Products",

              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productsService.products.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 17, right: 17, top: 8),
                  width: 156,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: GestureDetector(
                    onTap: () {
                      productsService.selectedProduct =
                          productsService.products[index].copy();
                      Navigator.pushNamed(context, "showproduct");
                    },
                    child: ProductCard(
                      products: productsService.products[index],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
