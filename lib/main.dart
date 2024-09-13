

import 'package:ch3_invoice_generator_app/screens/cartpage.dart';
import 'package:ch3_invoice_generator_app/screens/detailpage.dart';
import 'package:ch3_invoice_generator_app/screens/homepage.dart';
import 'package:ch3_invoice_generator_app/screens/pdf_page.dart';
import 'package:ch3_invoice_generator_app/screens/splesh_screen.dart';
import 'package:ch3_invoice_generator_app/screens/wishlist.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context){
          return Splash_Screen();
        },
        "home":(context){
          return HomePage();
        },
        "detail":(context){
          return DetailPage();
        },
        "cart":(context){
          return CartPage();
        },
        "pdf":(context){
          return PdfPage();
        },
        "wishlist":(context){
          return WishList();
        },
      },
    ),
  );
}