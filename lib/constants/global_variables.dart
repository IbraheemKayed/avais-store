import 'package:flutter/material.dart';
import 'package:flutter_wp_woocommerce/woocommerce.dart';

class GlobalVariables {

WooCommerce woocommerce = WooCommerce(
  baseUrl: 'avais-store.com',
  consumerKey: 'ck_c3e0700d3d80582f2471ddfc850c9102285ff325',
  consumerSecret: 'cs_8095ba71bca23877ac5187b1b771f25f0e4f20e7');



  static bool isArabic = true;
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 107, 192, 238),
      Color.fromARGB(255, 108, 193, 239),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> carouselImages = [
    'assets/images/avais1.jpg',
    'assets/images/avais2.jpg',
    'assets/images/avais3.jpg',
    'assets/images/avais4.jpg',
    'assets/images/avais5.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'New Arrivals',
      'image': 'assets/images/new_arrival.jpg',
    },
    {
      'title': 'Outerwears',
      'image': 'assets/images/outwears.jpg',
    },
    {
      'title': 'Tops',
      'image': 'assets/images/tops.jpg',
    },
    {
      'title': 'Dresses',
      'image': 'assets/images/dresses.jpg',
    },
    {
      'title': 'Shirts',
      'image': 'assets/images/shirts.jpg',
    },
    {
      'title': 'Jeans',
      'image': 'assets/images/jeans.jpg',
    },
    {
      'title': 'Bags',
      'image': 'assets/images/bags.jpg',
    },
    {
      'title': 'Accessories',
      'image': 'assets/images/accessories.jpg',
    },
    {
      'title': 'Lingerie',
      'image': 'assets/images/lingerie.jpg',
    },
    {
      'title': 'Footwear',
      'image': 'assets/images/shose.jpg',
    },
  ];

  static const List<Map<String, String>> categoryImagesAr = [
    {
      'title': 'وصل حديثاً',
      'image': 'assets/images/new_arrival.jpg',
    },
    {
      'title': 'ملابس الخرجة',
      'image': 'assets/images/outwears.jpg',
    },
    {
      'title': 'التوبس',
      'image': 'assets/images/tops.jpg',
    },
    {
      'title': 'الفساتين',
      'image': 'assets/images/dresses.jpg',
    },
    {
      'title': 'قمصان',
      'image': 'assets/images/shirts.jpg',
    },
    {
      'title': 'الجينز',
      'image': 'assets/images/jeans.jpg',
    },
    {
      'title': 'الشناتي',
      'image': 'assets/images/bags.jpg',
    },
    {
      'title': 'الإكسسوارات',
      'image': 'assets/images/accessories.jpg',
    },
    {
      'title': 'اللانجري',
      'image': 'assets/images/lingerie.jpg',
    },
    {
      'title': 'الأحذية',
      'image': 'assets/images/shose.jpg',
    },
  ];
}
