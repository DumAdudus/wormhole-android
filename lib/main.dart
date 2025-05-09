import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'rust/api.dart';
import 'navigation/navigation.dart';
import 'rust/frb_generated.dart';
import 'settings/settings.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';
import 'theme/theme_provider.dart';
import 'utils/log.dart';

void main() {
  initLogging();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    initBackend();
  }

  void initBackend() async {
    await RustLib.init();
    final tempDir = (await getTemporaryDirectory()).path;
    init(tempFilePath: tempDir);
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.theme = await Settings.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              if (supportedLocales
                  .map((e) => e.languageCode)
                  .contains(deviceLocale?.languageCode)) {
                return deviceLocale;
              }
              logger.config('fallback to default locale');
              return const Locale('en');
            },
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeChangeProvider.isDarkThemeActive()
                ? ThemeMode.dark
                : ThemeMode.light,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Navigation(),
          );
        },
      ),
    );
  }
}
