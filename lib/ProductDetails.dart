import 'package:meta/meta.dart';

class ProductDetail {
  String name;
  String imageUrl;
  double rating;

  ProductDetail({
    @required this.name,
    @required this.imageUrl,
    @required this.rating,
  });
}
