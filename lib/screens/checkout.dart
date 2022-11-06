import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myfood_app/provider/product_provider.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/models/product.dart';
import 'package:provider/provider.dart';
// import 'package:todolistapp/provider/website_provider.dart';

class checkout extends StatelessWidget {
  const checkout();

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              height: 100.0,
              child: Icon(
                Icons.check_box,
                size: 200.0,
                color: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Text(
                'Your Order has been placed.',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
