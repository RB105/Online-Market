import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:changelang/core/themes/dark_mode.dart';
import 'package:changelang/core/themes/light_mode.dart';
import 'package:changelang/view/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(EasyLocalization(
      saveLocale: true, // this for save last amendment
      startLocale: const Locale("ru"),
      supportedLocales: const [Locale("en"), Locale("ru"), Locale("uz")],
      path: "lib/core/lang",
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: LightThemMode.theme,
      dark: DarkThemMode.theme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
