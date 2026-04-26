
import 'package:avais_store/common/widgets/loader.dart';
import 'package:avais_store/common/widgets/stars.dart';
import 'package:avais_store/features/home/services/home_services.dart';
import 'package:avais_store/features/models/product.dart';
import 'package:avais_store/features/product_details/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();
  double avgRatingg = 0;
  double myRating = 0;
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

 

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    const Locale english = Locale('en');
    return product == null
        ? const Loader()
        : product!.product_title.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment:
                                Localizations.localeOf(context) == english
                                    ? Alignment.topLeft
                                    : Alignment.topRight,
                            child: Text(
                              AppLocalizations.of(context)?.title ?? 
                              '',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: double.infinity,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(
                      product!.product_image_url,
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ) ,
                    )
                    ,
                    Container(
                      padding: const EdgeInsets.only(left: 0),
                      alignment: Alignment.center,
                      child: Text(
                        '₪${product!.product_price}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        product!.product_title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Stars(rating: double.parse(product!.product_rating)),
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // children: product!.image_url
                        //     .map(
                        //       (e) => Image.network(
                        //         e,
                        //         fit: BoxFit.contain,
                        //         width: 100,
                        //         height: 100,
                        //       ),
                        //     )
                        //     .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 15),
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)?.seeAllDetails ?? 
                        '',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
