import 'dart:convert';
import 'package:avais_store/common/widgets/languages_picker_widget.dart';
import 'package:avais_store/constants/global_variables.dart';
import 'package:avais_store/features/models/product.dart';
import 'package:avais_store/features/product_details/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:async';
import 'package:woosignal/woosignal.dart';


class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({super.key, required this.category});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryDealsScreenState createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product> products = []; // List to store products
  List<Product> productsCat = [];
  int k = 0;
  @override
  void initState() {
    super.initState();
    fetchProducts(); // Fetch products when the widget initializes
  }

  Future<void> fetchProducts() async {
    
    final response =
        await http.get(Uri.parse('https://www.avais-store.com/wp-json/wc/v3/products?consumer_key=ck_1bc3925514512da2d8ef030b6781970eb9245a37&consumer_secret=cs_f6d5e54be7292ea188ed5a7e0fa4950df3f0fa2a'));

    if (response.statusCode == 200) {
      final List<dynamic> parsedProducts = json.decode(response.body);
      setState(() {
        products = parsedProducts
            .map((jsonProduct) => Product.fromJson(jsonProduct))
            .toList();
        for (int i = 0; i < GlobalVariables.categoryImages.length; i++) {
          if (widget.category.toString() ==
                  GlobalVariables.categoryImagesAr[i]['title'] ||
              widget.category.toString() ==
                  GlobalVariables.categoryImages[i]['title']) {
            k = i;
            break;
          }
        }
        for (int i = 0; i < products.length; i++) {
          if (products[i].product_category ==
                  GlobalVariables.categoryImages[k]['title'] ||
              products[i].product_category ==
                  GlobalVariables.categoryImagesAr[k]['title']) {
            productsCat.add(products[i]);
          }
        }
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          actions: [LanguagePickerWidget()],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              //'keep Shopping For ${widget.category}',
              '${AppLocalizations.of(context)?.keepShoppingFor ?? ''} ${widget.category}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 700,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 15),
              itemCount: productsCat.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 3,
              ),
              itemBuilder: (context, index) {
                final product = productsCat[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailScreen.routeName,
                        arguments: product);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 125,
                        width: 160,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Image.network(
                            fit: BoxFit.fill,
                            product.product_image_url,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding:
                            const EdgeInsets.only(left: 0, top: 8, right: 15),
                        child: Text(
                          product.product_title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
