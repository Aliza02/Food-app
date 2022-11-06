import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myfood_app/provider/product_provider.dart';
import 'package:myfood_app/screens/checkout.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/models/product.dart';
import 'package:provider/provider.dart';
// import 'package:todolistapp/provider/website_provider.dart';

class productlist extends StatelessWidget {
  const productlist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text("Products"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, ProductProvider, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ProductProvider.added_product.length,
                itemBuilder: (context, index) => Container(
                  height: 100.0,
                  width: 100.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Card(
                      child: ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            ProductProvider.removeproduct(product(
                                ProductProvider.added_product[index].title,
                                ProductProvider.product_price[index].price));
                            ;
                            debugPrint("Dada");
                          },
                        ),
                        title: Text(
                          ProductProvider.added_product[index].title,
                          style: TextStyle(fontSize: 19.0),
                        ),
                        subtitle: Text(
                          ProductProvider.product_price[index].price,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 400.0,
              height: 60.0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => checkout())));
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
