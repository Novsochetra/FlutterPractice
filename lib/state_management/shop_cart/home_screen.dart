import 'package:FirstFlutter/state_management/shop_cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/cart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CartScreen()));
              })
        ],
      ),
      body: Container(child: ShoppingList()),
    );
  }
}

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ShoppingItem(index);
      },
      itemCount: 20,
    );
  }
}

class ShoppingItem extends StatelessWidget {
  final int index;

  ShoppingItem(this.index);

  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context);
    var isAdded = cartModel.list.contains(index);
    return ListTile(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("ITEM: $index"),
        IconButton(
            icon: Icon(isAdded ? Icons.check : Icons.add_shopping_cart),
            onPressed: () {
              isAdded
                  ? cartModel.removeCart(index)
                  : cartModel.addToCart(index, "Item $index");
            })
      ],
    ));
  }
}
