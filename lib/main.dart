import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localizationapp/app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ValueNotifier<String> locale = ValueNotifier<String>('pt');
  void changeLocale(String value) {
    locale.value = value;
    print(locale.value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: Locale(locale.value),
      localizationsDelegates: localizationsDelegates(),
      supportedLocales: supportLocales(),
      home: const HomePageBridge(),
    );
  }
}

class HomePageBridge extends StatelessWidget {
  const HomePageBridge({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage(
      title: AppLocalizations.of(context).helloWorld,
      counterDescription: AppLocalizations.of(context).counterDescription,
      onTapBottomBar: (int value) {
        switch (value) {
          case 0:
            MyApp().changeLocale('pt');
            break;
          case 1:
            MyApp().changeLocale('en');
            break;
          case 2:
            MyApp().changeLocale('es');
            break;
        }
      },
    );
  }
}

Iterable<Locale> supportLocales() {
  return [const Locale('pt'), const Locale('en'), const Locale('es')];
}

Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates() {
  return [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];
}
