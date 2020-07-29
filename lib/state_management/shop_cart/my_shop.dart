import 'package:FirstFlutter/state_management/shop_cart/cart_screen.dart';
import 'package:FirstFlutter/state_management/shop_cart/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';

void main() {
  runApp(MyShop());
}

class MyShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CartModel>(
            create: (context) => CartModel(),
          )
        ],
        child: MaterialApp(title: "Shop Cart", initialRoute: '/', routes: {
          '/': (context) => HomeScreen(),
          '/cart': (context) => CartScreen(),
        }));
  }
}
