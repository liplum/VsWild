import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vs_wild/hud.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Localizations Sample App',
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text("title").tr(),
        ),
        body: const Hud(),
      ),
    );
  }
}
