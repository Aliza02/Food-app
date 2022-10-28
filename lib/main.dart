import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myfood_app/provider/product_provider.dart';
import 'package:myfood_app/screens/checkout.dart';
import 'package:myfood_app/screens/detail_screen.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/screens/login.dart';
import 'package:myfood_app/screens/product_list.dart';
import 'package:myfood_app/screens/profile_screen.dart';
import 'package:myfood_app/screens/signup.dart';
import 'package:myfood_app/screens/skip_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.white,
            backgroundColor: Colors.pinkAccent,
          ),
          primaryColor: Colors.pinkAccent,
          // accentColor: Color(0xff04d4ee),
        ),
        home: HomePage(),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,

    //   // home: StreamBuilder(
    //   //   stream: FirebaseAuth.instance.authStateChanges(),
    //   //   builder: (context, snapshot) {
    //   //     if (snapshot.hasData) {
    //   //       return HomePage();
    //   //     } else {
    //   //       return Login();
    //   //     }
    //   //   },
    //   // ),

    // );
  }
}
