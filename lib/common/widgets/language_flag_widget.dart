import 'package:flutter/material.dart';
import 'package:avais_store/l10n/l10n.dart';
import 'package:avais_store/providers/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageFlagWidget extends StatelessWidget {
  const LanguageFlagWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, value, child) => Center(
        child: Text(
          L10n.getFlag(value.locale.languageCode),
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
