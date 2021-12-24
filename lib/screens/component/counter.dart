import 'package:flutter/material.dart';
import 'package:frontendtest_kriya/screens/component/cart.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  Counter({this.id});

  final int id;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<Cart>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            if (_total > 0) {
              setState(() {
                _total--;
              });
              bloc.descreaseItem(widget.id);
            }
          },
          child: Icon(Icons.remove, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
          ),
        ),
        Text("$_total"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _total++;
            });
            bloc.increaseItem(widget.id);
          },
          child: Icon(Icons.add, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
          ),
        ),
      ],
    );
  }
}
