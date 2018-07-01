import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingHomePage());
}

class ShoppingHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Flutter Cart"),
        ),
        body: ShoppingList(),
      ),
    );
  }
}

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
            width: 10.0, color: Colors.black, style: BorderStyle.solid),
      ),
      child: ShoppingItemStack(),
    );
  }
}

//Widget _gridView(){
//  return Padding(
//    padding: const ,
//  )
//}

class ShoppingItemStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[imageItem(), nameItem(), ratingItem()],
    );
  }

  Widget imageItem() {
    return Container(
      child: Image.network(
        "https://assets.abfrlcdn.com/img/app/product/1/199775-614183-large.jpg",
        fit: BoxFit.fill,
      ),
      color: Colors.pink,
    );
  }

  Widget nameItem() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: BoxConstraints.expand(
          height: 40.0,
        ),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: Text(
              "Blue Shirt",
              style: new TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ratingItem() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        constraints: BoxConstraints.tightFor(
          height: 30.0,
          width: 30.0,
        ),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                new Text(
                  "4.2",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
