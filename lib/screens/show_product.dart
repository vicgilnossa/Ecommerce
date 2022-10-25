import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_form_provider.dart';
import '../services/product_services.dart';

class ShowProductScreen extends StatelessWidget {
  const ShowProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct),
      child: _ShowProductBody(
        productsService: productsService,
      ),
    );
    ;
  }
}

class _ShowProductBody extends StatelessWidget {
  const _ShowProductBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  final ProductService productsService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          _ProductPicture(productsService.selectedProduct.picture),
          SizedBox(
            height: 20,
          ),
          _TitleBar(
            name: productsService.selectedProduct.name,
            price: productsService.selectedProduct.price,
          ),
          _OverviewBox(
            overview: productsService.selectedProduct.overview,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "editproduct");
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: const Color(0xffA3B484),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffA3B484)),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                        child: Text("Compra ahora"),
                      )),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class _OverviewBox extends StatelessWidget {
  final String overview;
  const _OverviewBox({
    Key? key,
    required this.overview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
      child: Container(
        width: double.infinity,
        height: 230,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Overview",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            overview,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ]),
      ),
    );
  }
}

class _ProductPicture extends StatelessWidget {
  final String? url;
  const _ProductPicture(this.url);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 327,
        height: 316,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Image(image: NetworkImage(url!)),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "home");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffF1F1F4),
            ),
            width: 48,
            height: 48,
            child: const Image(image: AssetImage("assets/gobackicon.png")),
          ),
        ),
      ),
    ]);
  }
}

class _TitleBar extends StatelessWidget {
  final String name;
  final int price;
  const _TitleBar({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 35),
      child: Row(
        children: [
          Container(
            width: 140,
            height: 50,
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(
            width: 100,
          ),
          Container(
            width: 100,
            height: 50,
            child: Text(
              '\$$price',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
