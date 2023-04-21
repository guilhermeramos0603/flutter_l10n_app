import 'package:flutter/material.dart';
import 'package:localizationapp/classes/language_constants.dart';
import 'package:localizationapp/router/custom_router.dart';
import 'package:localizationapp/router/route_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

MaterialColor currentColor = Colors.green;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internationalization App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: currentColor,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: CustomRouter.generatedRoute,
      initialRoute: homeRoute,
      locale: _locale,
    );
  }
}
