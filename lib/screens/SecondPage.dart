import 'package:flutter/material.dart';
import 'package:frontendtest_kriya/screen/component/cart_bloc.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          int giftIndex = cart.keys.toList()[index];
          int count = cart[giftIndex];
          return ListTile(
            // leading: Container(
            //   height: 70,
            //   width: 70,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/checkin.jpg"),
            //       fit: BoxFit.fitWidth,
            //     ),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            // ),
            title: Text('Item Count $giftIndex: $count'),
          );
        },
      ),
    );
  }
}