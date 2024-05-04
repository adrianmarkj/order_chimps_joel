import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'application/core/routes.dart';
import 'application/core/utils/app_constants.dart';
import 'application/core/utils/app_localizations.dart';
import 'injection.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: kAppName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.kHomePage,
        onGenerateRoute: Routes.generateRoute,
        supportedLocales: const [
          Locale(kLocaleEN, "US"),
          Locale(kLocaleSI, "LK"),
          Locale(kLocaleTA, "TA")
        ],
        locale: const Locale(kLocaleEN, "US"),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      );
    });
  }
}