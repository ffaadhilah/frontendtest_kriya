import 'package:flutter/material.dart';
import 'package:frontendtest_kriya/screens/FirstScreen.dart';
import 'screen/component/cart_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
        create: (context) => CartBloc(),
        child: MaterialApp(
          title: 'Front end Test KRIYA',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FirstScreen(),
        ));
  }
}
