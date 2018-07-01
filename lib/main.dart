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
        body: ShoppingListItem(),
      ),
    );
  }
}

class ShoppingListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      margin: EdgeInsets.all(4.0),
      child: ShoppingItemStack(),
    );
  }
}

class ShoppingItemStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 8.0,
        child: InkWell(
          onTap: () {
            print("tapped");
//          Navigator.of(context).push(
//              new MaterialPageRoute(builder: (context) => new DetailPage()));
          },
          child: new Stack(fit: StackFit.expand, children: <Widget>[
            ItemImage(),
            ItemRating(),
            ItemName(),
          ]),
        ));
  }
}

class ItemImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://assets.abfrlcdn.com/img/app/product/1/199775-614183-large.jpg",
      fit: BoxFit.cover,
    );
  }
}

class ItemName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: BoxConstraints.expand(
          height: 40.0,
        ),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Text(
              "Blue Shirt",
              style: new TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18.0,
              ),
              const SizedBox(
                width: 5.0,
              ),
              new Text(
                "4.2",
                maxLines: 1,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
