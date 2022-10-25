import 'dart:io';

import 'package:ecommerce_cbd/providers/product_form_provider.dart';
import 'package:ecommerce_cbd/style/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../services/product_services.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct),
      child: _EditProductBody(
        productsService: productsService,
      ),
    );
  }
}

class _EditProductBody extends StatelessWidget {
  const _EditProductBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  final ProductService productsService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 26),
                child: Container(
                  width: 327,
                  height: 316,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: _ProductPicture(
                    url: productsService.selectedProduct.picture,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 65),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "showproduct");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF1F1F4),
                        ),
                        width: 48,
                        height: 48,
                        child: const Image(
                            image: AssetImage("assets/gobackicon.png")),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 175,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () async {
                        final picker = ImagePicker();
                        final XFile? pickedFile = await picker.pickImage(
                            source: ImageSource.gallery, imageQuality: 100);

                        if (pickedFile == null) {
                          print("No seleccionó nada");
                          return;
                        }
                        print("Tenemos imagen ${pickedFile.path}");

                        productsService
                            .updateSelectedProductImage(pickedFile.path);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF1F1F4),
                        ),
                        width: 48,
                        height: 48,
                        child: const Image(
                            image: AssetImage("assets/uploadimageicon.png")),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            const _ProductForm(),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xffA3B484)),
                ),
                onPressed: () async {
                  if (!productForm.isValidForm()) return;
                  final String? imageUrl = await productsService.uploadImage();
                  if (imageUrl != null) productForm.product.picture = imageUrl;
                  await productsService
                      .saveOrCreateProduct(productForm.product);

                  Navigator.pushNamed(context, "home");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  child: Text("Guardar"),
                ))
          ],
        ),
      ),
    );
  }
}

class _ProductPicture extends StatelessWidget {
  const _ProductPicture({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return getImage(url);
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Form(
      key: productForm.formKey,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: TextFormField(
            initialValue: product.name,
            onChanged: (value) => product.name = value,
            validator: (value) {
              if (value == null || value.length < 1) {
                return "El nombre es obligatorio";
              }
            },
            cursorColor: const Color(0xffFFA05B),
            keyboardType: TextInputType.name,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Ej: camiseta roja", labelText: "Nombre"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 15),
          child: TextFormField(
            initialValue: '${product.price}',
            onChanged: (value) {
              if (int.tryParse(value) == null) {
                product.price = 0;
              } else {
                product.price = int.parse(value);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty)
                return "El precio es obligatorio";
            },
            cursorColor: const Color(0xffFFA05B),
            keyboardType: TextInputType.number,
            decoration: InputDecorations.authInputDecoration(
                hintText: "\$", labelText: "Precio"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 15),
          child: TextFormField(
              initialValue: product.overview,
              onChanged: (value) => product.overview = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "La descripción es obligatoria";
                }
              },
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
      ]),
    );
  }
}

Widget getImage(String? picture) {
  if (picture == null) {
    return Container(
      width: 10,
      height: 80,
      child: const Image(image: AssetImage("assets/uploadimageph.png")),
    );
  }

  if (picture.startsWith("http")) {
    return Container(
      width: 10,
      height: 10,
      child: const Image(image: AssetImage("assets/uploadimageph.png")),
    );
  }

  return Image.file(
    File(picture),
    fit: BoxFit.cover,
  );
}
