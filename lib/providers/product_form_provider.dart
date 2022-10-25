import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Product product;

  ProductFormProvider(this.product);

  bool isValidForm() {
    print(product.name);
    print(product.price);
    return formKey.currentState?.validate() ?? false;
  }
}
