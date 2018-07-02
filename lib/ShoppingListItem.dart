import 'package:flutter/material.dart';
import 'package:flutter_app/DetailPage.dart';
import 'package:flutter_app/ProductDetails.dart';

class ShoppingListItem extends StatelessWidget {
  final ProductDetail product;

  const ShoppingListItem({@required this.product});

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
      child: ShoppingItemStack(product),
    );
  }
}

class ShoppingItemStack extends StatelessWidget {
  final ProductDetail product;

  ShoppingItemStack(this.product);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      child: InkWell(
        onTap: () {
          print(product.name + " tapped");
          Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => new DetailPage()));
          Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text(product.name + " tapped"),
              ));
        },
        child: new Stack(fit: StackFit.expand, children: <Widget>[
          ItemImage(product),
          ItemRating(product),
          ItemName(product),
        ]),
      ),
      color: Colors.transparent,
    );
  }
}

class ItemImage extends StatelessWidget {
  final ProductDetail product;

  ItemImage(this.product);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      product.imageUrl,
      fit: BoxFit.cover,
    );
  }
}

class ItemName extends StatelessWidget {
  final ProductDetail product;

  ItemName(this.product);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: BoxConstraints.expand(
          height: 40.0,
        ),
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Text(
              product.name,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemRating extends StatelessWidget {
  final ProductDetail product;

  ItemRating(this.product);

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
                product.rating.toString(),
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
