import 'package:ecommerce_cbd/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product products;

  const ProductCard({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int price = products.price;
    return Stack(children: [
      ProductPicture(products.picture),
      Column(children: [
        const SizedBox(
          height: 105.4,
        ),
        Center(
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            products.name,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "\$$price",
          style: Theme.of(context).textTheme.overline,
        ),
      ]),
    ]);
  }
}

class ProductPicture extends StatelessWidget {
  final String? url;
  const ProductPicture(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Image(image: NetworkImage(url!)),
    );
  }
}
