

import 'package:avais_store/common/widgets/languages_picker_widget.dart';
import 'package:avais_store/constants/global_variables.dart';
import 'package:avais_store/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
         actions: const [LanguagePickerWidget()],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              // ),
              RichText(
                text:  TextSpan(
                    text: //'Hello',
                    AppLocalizations.of(context)?.hello ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    children: const [
                      TextSpan(
                        text: ', Ahmad',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TopButtons(),
          const SizedBox(height: 20),
          //const Orders(),
        ],
      ),
    );
  }
}
