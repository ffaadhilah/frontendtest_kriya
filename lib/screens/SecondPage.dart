import 'package:flutter/material.dart';
import 'package:frontendtest_kriya/screens/FirstScreen.dart';
import 'package:frontendtest_kriya/screens/component/cart.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<Cart>(context);
    var cart = bloc.cart;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 30.0),
            onPressed: () {
              bloc.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                  (Route<dynamic> route) => false);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            int giftIndex = cart.keys.toList()[index];
            int count = cart[giftIndex];
            return ListTile(
              title: Text('Item Count $giftIndex: $count'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            bloc.clear();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => FirstScreen()),
                (Route<dynamic> route) => false);
          },
          child: Icon(Icons.shopping_bag),
        ),
      ),
    );
  }
}
