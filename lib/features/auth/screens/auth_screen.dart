import 'package:avais_store/common/widgets/custom_button.dart';
import 'package:avais_store/common/widgets/custom_textfield.dart';
import 'package:avais_store/common/widgets/languages_picker_widget.dart';
import 'package:avais_store/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth-screen';
  @override
  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
 
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       AppLocalizations.of(context)?.welcome ?? '',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                LanguagePickerWidget(),
                   ],
                 ),
                ListTile(
                  title: Text(
                     AppLocalizations.of(context)?.creatAcount ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                    activeColor: Color.fromARGB(255, 107, 192, 238),
                  ),
                ),
                // ignore: sdk_version_ui_as_code
                if (_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            hintText:  AppLocalizations.of(context)?.name ?? '',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hintText:  AppLocalizations.of(context)?.email ?? '',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            hintText:  AppLocalizations.of(context)?.password ?? '',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomButton(
                            color: Color.fromARGB(255, 107, 192, 238),
                            text:  AppLocalizations.of(context)?.signUp ?? '',
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  title:  Text(
                     AppLocalizations.of(context)?.sign_In ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(
                        () {
                          _auth = val!;
                        },
                      );
                    },
                    activeColor: GlobalVariables.secondaryColor,
                  ),
                ),
                // ignore: sdk_version_ui_as_code
                if (_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText:  AppLocalizations.of(context)?.email ?? '',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            hintText:  AppLocalizations.of(context)?.password ?? '',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomButton(
                            color: Color.fromARGB(255, 107, 192, 238),
                            text:  AppLocalizations.of(context)?.signIn ?? '',
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                
                              }
                            },
                          ),
                        ],
                      ),
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
