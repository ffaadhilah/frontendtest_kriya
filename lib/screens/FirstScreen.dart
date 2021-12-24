import 'package:flutter/material.dart';
import 'package:frontendtest_kriya/screens/SecondPage.dart';
import 'package:frontendtest_kriya/screens/component/counter.dart';
import 'package:frontendtest_kriya/model/data_items.dart';
import 'package:provider/provider.dart';
import 'component/cart.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Client client = Client();
  List<DataItems> _dataItems;
  List totalItems;
  int totalCount = 0;

  @override
  void initState() {
    super.initState();
    getItemList();
  }

  //getting the data from API
  Future getItemList() async {
    final response =
        await client.get("https://jsonplaceholder.typicode.com/todos");
    if (response.statusCode == 200) {
      setState(() {
        _dataItems = (json.decode(response.body) as List)
            .map((data) => DataItems.fromJson(data))
            .toList();
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<Cart>(context);
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Items  : $totalCount'),
      ),
      body: _dataItems == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scrollbar(
              child: ListView.builder(
                itemCount: _dataItems == null ? 0 : _dataItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.grey[200],
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  '${_dataItems[index].title}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150.0,
                              color: Colors.transparent,
                              child: Counter(id: _dataItems[index].id),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(),
            ),
          ).then((value) => setState(() => {}));
        },
        tooltip: 'Increment',
        child: Icon(Icons.shopping_cart_rounded),
      ),
    );
  }
}
