import 'dart:async';

import 'package:avais_store/common/widgets/languages_picker_widget.dart';
import 'package:avais_store/constants/global_variables.dart';
import 'package:avais_store/features/home/widgets/address_box.dart';
import 'package:avais_store/features/home/widgets/carousel_image.dart';
import 'package:avais_store/features/home/widgets/deal_of_day.dart';
import 'package:avais_store/features/home/widgets/top_categories.dart';
import 'package:avais_store/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  // void navigateToSearchScreen(String query) {
  //   Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  // }

  void updateLan(String countryCode) {
    var provider = Provider.of<LanguageProvider>(context, listen: false);
    provider.updateLanguage(Locale(countryCode));
    setState(() {});
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 107, 192, 238),
              ),
              child: Text(
                'Avais Store',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)?.privacyPolicy ?? '',
              ), //AppLocalizations.of(context)?.privacyAndCookie ?? ''),
              onTap: () {
                Uri privacyPolicy =
                    Uri.parse('https://avais-store.com/privacy-policy/');
                _launchUrl(privacyPolicy);
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)?.contactUs ??
                  ''), //AppLocalizations.of(context)?.contactUs ?? ''),
              onTap: () {
                Uri contact = Uri.parse('https://avais-store.com/contact-us/');
                _launchUrl(contact);
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)?.refundAndReturns ??
                  ''), //AppLocalizations.of(context)?.termsAndConditions ?? ''),
              onTap: () {
                Uri terms =
                    Uri.parse('https://avais-store.com/refund_returns/');
                _launchUrl(terms);
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)?.aboutUs ??
                  ''), //AppLocalizations.of(context)?.aboutUs ?? ''),
              onTap: () {
                Uri about = Uri.parse('https://avais-store.com/about-us/');
                _launchUrl(about);
              },
            ),
            ListTile(
              title: Text(
                  AppLocalizations.of(context)?.shippingAndDeliveryPolicy ??
                      ''), //AppLocalizations.of(context)?.aboutUs ?? ''),
              onTap: () {
                Uri about = Uri.parse(
                    'https://avais-store.com/shipping-and-delivery-policy/');
                _launchUrl(about);
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)?.copyright ??
                  ''), //AppLocalizations.of(context)?.aboutUs ?? ''),
              onTap: () {
                Uri about = Uri.parse(
                    'https://avais-store.com/intellectual-property-rights-and-copyright/');
                _launchUrl(about);
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)?.logOut ?? ''),
              onTap: () {},
            ),
            // SizedBox(height: 160,),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Uri facebook = Uri.parse(
                          'https://www.facebook.com/profile.php?id=100093713682647&mibextid=LQQJ4d');
                      _launchUrl(facebook);
                    },
                    icon: FaIcon(FontAwesomeIcons.facebook)),
                IconButton(
                    onPressed: () {
                      Uri instagram =
                          Uri.parse('https://www.instagram.com/avais_store/');
                      _launchUrl(instagram);
                    },
                    icon: FaIcon(FontAwesomeIcons.instagram)),
                IconButton(
                    onPressed: () {
                      Uri telegram = Uri.parse('https://t.me/avais_store');
                      _launchUrl(telegram);
                    },
                    icon: FaIcon(FontAwesomeIcons.telegram)),
                IconButton(
                    onPressed: () {
                      Uri tiktok =
                          Uri.parse('https://www.tiktok.com/@avais.store');
                      _launchUrl(tiktok);
                    },
                    icon: FaIcon(FontAwesomeIcons.tiktok)),
              ],
            )
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          actions: const [LanguagePickerWidget()],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      //onFieldSubmitted:  navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1),
                        ),
                        hintText:
                            AppLocalizations.of(context)?.searchForAProduct ??
                                '',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopCategories(),
            SizedBox(
              height: 10,
            ),
            CarouselImage(),
            SizedBox(
              height: 10,
            ),
            DealOfDay(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
