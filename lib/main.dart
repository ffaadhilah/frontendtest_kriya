import 'package:flutter/material.dart';
import 'package:frontendtest_kriya/screens/FirstScreen.dart';
import 'screens/component/cart.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
        create: (context) => Cart(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Front end Test KRIYA',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FirstScreen(),
        ));
  }
}
