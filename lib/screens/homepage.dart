import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfood_app/models/product.dart';
import 'package:myfood_app/provider/product_provider.dart';
import 'package:myfood_app/screens/about.dart';
import 'package:myfood_app/screens/burger_category.dart';
import 'package:myfood_app/screens/contact.dart';
import 'package:myfood_app/screens/login.dart';
import 'package:myfood_app/screens/pizza_category.dart';
import 'package:myfood_app/screens/product_list.dart';
import 'package:myfood_app/screens/salad_category.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
          padding: const EdgeInsets.only(right: 40),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 320,
            width: 210,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 6),
                  child: Text(
                    foodTitle,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
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
          margin: EdgeInsets.fromLTRB(0, 5, 85, 0),
          child: CircleAvatar(
            maxRadius: 60,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              "images/$image.png",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSingleCategory(context, {String image, String name}) {
    bool yes = MediaQuery.of(context).size.height > 900;
    return GestureDetector(
      onTap: () {
        if (name == 'Pizza') {
          debugPrint("dadaafaf");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Pizza(),
            ),
          );
        }

        if (name == 'Salad') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Salad(),
            ),
          );
        }
        if (name == 'Burger') {
          debugPrint("dada");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Burger(),
            ),
          );
        }
      },
      child: Card(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.width / 100,
            left: MediaQuery.of(context).size.width / 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.5,
          width: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/$image.png"),
                        ),
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureProduct(context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    bool yes = MediaQuery.of(context).size.width > 600;

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 240,
                      child: Row(
                        children: [
                          _buildSingleFeature(
                            context: context,
                            foodTitle: "Cheese Pasta",
                            price: "\$40",
                            image: "pastacheese",
                          ),
                          _buildSingleFeature(
                            context: context,
                            foodTitle: " Beef Steak",
                            price: "\$50",
                            image: "chickenbrost",
                          ),
                          _buildSingleFeature(
                            context: context,
                            foodTitle: " Smash Burger",
                            price: "\$80",
                            image: "bargar",
                          ),
                          _buildSingleFeature(
                            context: context,
                            foodTitle: " Fried Rice",
                            price: "\$50",
                            image: "chickenbrost",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPart(context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xfff2f3f4),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 240,
                      child: Row(
                        children: [
                          _buildSingleCategory(context,
                              name: "Pizza", image: "pizza"),
                          _buildSingleCategory(context,
                              name: "Salad", image: "salad"),
                          _buildSingleCategory(context,
                              name: "Burger", image: "bargar"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      fontSize: 23,
                      color: Theme.of(context).accentColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildFeatureProduct(context),
          ],
        ),
      ),
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
              FirebaseAuth.instance.signOut();
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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: _buildMyDrawer(context),
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
          title: Text("Food App"),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              _buildBottomPart(context),
            ],
          ),
        ),
      ),
    );
  }
}
