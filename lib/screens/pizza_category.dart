import 'package:flutter/material.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/screens/contact.dart';
import 'package:myfood_app/screens/about.dart';
import 'package:myfood_app/screens/product_list.dart';
import 'package:myfood_app/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:myfood_app/models/product.dart';
import 'package:myfood_app/provider/product_provider.dart';

class Pizza extends StatelessWidget {
  Widget _buildSingleFeature({
    context,
    String foodTitle,
    String image,
    String price,
  }) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.width * 0.5,
            width: 170,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 6),
                  child: Text(
                    foodTitle,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 6),
                  child: Text(
                    price,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  height: 35,
                  width: 200,
                  child: ElevatedButton(
                    child: Text("Add to cart"),
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .addproduct(product(foodTitle, price));
                      Provider.of<ProductProvider>(context, listen: false)
                          .addprice(product(foodTitle, price));
                      debugPrint('add to cart');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        disabledBackgroundColor: Colors.pinkAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 5, 85, 0),
          child: CircleAvatar(
            maxRadius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              "images/$image.png",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMyDrawer(context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Food App"),
            accountEmail: Text("foodapp@gmail.com"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            leading: Icon(
              Icons.home,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("HomePage"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Contact(),
                ),
              );
            },
            leading: Icon(
              Icons.contact_phone,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            title: Text("Contact Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              );
            },
            leading: Icon(
              Icons.info,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("About Page"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => productlist(),
                ),
              );
            },
            leading: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Order"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.pinkAccent,
          actions: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 12.0, 12.0, 0),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {
                  print("added");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => productlist()),
                  );
                },
              ),
            ),
          ],
          titleSpacing: 20,
          title: Text("Pizza"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildSingleFeature(
                      context: context,
                      foodTitle: "Chicken Tikka",
                      price: "\$80",
                      image: "tikka",
                    ),
                    _buildSingleFeature(
                      context: context,
                      foodTitle: "Chicken Fajita",
                      price: "\$70",
                      image: "fajita",
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  children: [
                    _buildSingleFeature(
                      context: context,
                      foodTitle: "Meat Pizza",
                      price: "\$80 ",
                      image: "fajita",
                    ),
                    _buildSingleFeature(
                      context: context,
                      foodTitle: "Cheese Pizza",
                      price: "\$70 ",
                      image: "tikka",
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  children: [
                    _buildSingleFeature(
                      context: context,
                      foodTitle: "Pepperoni",
                      price: "\$80",
                      image: "tikka",
                    ),
                    _buildSingleFeature(
                      context: context,
                      foodTitle: "Veggie Pizza",
                      price: "\$70",
                      image: "fajita",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
