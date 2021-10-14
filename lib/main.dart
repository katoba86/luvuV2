import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'language/i18n.dart';
import 'managers/dialog_manager.dart';
import 'locator.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';
import 'ui/router.dart';
import 'ui/shared/theme.dart';
import 'ui/views/startup_view.dart';

void main() async{
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}







class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: I18nDelegate.supportedLocals,
      title: 'Luvu',
      builder: (context, child){
        return Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(child: child!)),
        );},
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: LuvuTheme.defaultTheme,
      home: StartupView(),
      onGenerateRoute: generateRoute,
    );
  }
}