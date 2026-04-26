// ignore_for_file: non_constant_identifier_names

class Product {
  final int product_id;
  final String product_title;
  final String product_description;
  final String product_price;
  final String product_stock_quantity;
  final String product_category;
  final String product_rating;
  final String product_image_url;

  Product(
      {required this.product_id,
      required this.product_title,
      required this.product_description,
      required this.product_price,
      required this.product_stock_quantity,
      required this.product_category,
      required this.product_rating,
      required this.product_image_url});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      product_id: json['product_id'] as int,
      product_title: json['product_title'] as String,
      product_description: json['product_description'] as String,
      product_price: json['product_price'] as String,
      product_stock_quantity: json['product_stock_quantity'] as String,
      product_category: json['product_category'] as String,
      product_rating: json['product_rating'] as String,
      product_image_url: json['product_image_url'] as String,
    );
  }
}
