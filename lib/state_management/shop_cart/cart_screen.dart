import 'model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: Container(child: CartList()),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context);
    List<Widget> items = cartModel.list.map((i) => CartItem(i)).toList();
    return ListView(
      children: items,
    );
  }
}

class CartItem extends StatelessWidget {
  final int index;
  CartItem(this.index);

  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context);
    var item = cartModel.byId[index];
    return ListTile(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("${item.name}"),
        InkWell(
            onTap: () {
              cartModel.removeCart(item.id);
            },
            child: Icon(Icons.cancel))
      ],
    ));
  }
}
