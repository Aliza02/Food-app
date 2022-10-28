import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<product> added_product = [];
  List<product> product_price = [];
  get productlist {
    return product;
  }

  get getWeb {
    return added_product;
  }

  addproduct(product newproduct) {
    added_product.add(newproduct);
  }

  addprice(product price) {
    product_price.add(price);
  }

  removeproduct(product cancelproduct) {
    added_product.remove(cancelproduct);
  }

  @override
  void notifyListeners();
}
