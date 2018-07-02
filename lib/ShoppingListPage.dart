import 'package:flutter/material.dart';
import 'package:flutter_app/Data.dart';
import 'package:flutter_app/ProductDetails.dart';
import 'package:flutter_app/ShoppingListItem.dart';

class ShoppingListPage extends StatelessWidget {
  List<ProductDetail> productsList;

  @override
  Widget build(BuildContext context) {
    productsList = Data.productsList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Flutter Cart"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {
                print("Sort icon pressed");
              },
            )
          ],
        ),
        body: _gridView(),
      ),
    );
  }

  Widget _gridView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: productsList
            .map(
              (product) => ShoppingListItem(product: product),
            )
            .toList(),
      ),
    );
  }
}
