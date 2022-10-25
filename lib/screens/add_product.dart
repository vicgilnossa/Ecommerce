import 'package:ecommerce_cbd/style/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/product_services.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _ProductPlaceholder("assets/addproductplaceholder.png"),
            Form(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    cursorColor: const Color(0xffFFA05B),
                    keyboardType: TextInputType.name,
                    decoration: InputDecorations.authInputDecoration(
                        hintText: "Ej: camiseta verde", labelText: "Nombre"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35, top: 15),
                  child: TextFormField(
                    cursorColor: const Color(0xffFFA05B),
                    keyboardType: TextInputType.number,
                    decoration: InputDecorations.authInputDecoration(
                        hintText: "\$", labelText: "Precio"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35, top: 15),
                  child: TextFormField(
                      cursorColor: const Color(0xffFFA05B),
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecorations.authInputDecoration(
                          hintText: "Describe de tu producto",
                          labelText: "Descripción")),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffA3B484)),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                      child: Text("Guardar"),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductPlaceholder extends StatelessWidget {
  final String? url;
  const _ProductPlaceholder(this.url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 24),
      child: Container(
        width: 327,
        height: 300,
        child: Stack(children: [
          Image(image: AssetImage(url!)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: 48,
              height: 48,
              child:
                  const Image(image: AssetImage("assets/uploadimageicon.png")),
            ),
          )
        ]),
      ),
    );
  }
}
