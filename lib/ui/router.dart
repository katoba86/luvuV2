
import 'package:flutter/material.dart';
import '../constants/route_names.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';




Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: LoginView(),
      );

    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: HomeView(),
      );



    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({required String routeName,required Widget viewToShow}) {

  return PageRouteBuilder(
    settings: RouteSettings(
      name: routeName
    ),
      transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation,Widget child){
        animation = CurvedAnimation(parent:animation,curve:Curves.easeInOutQuart);

        return FadeTransition(
         opacity: animation,

          child: child,
        );
      },
      pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation){
        return viewToShow;
      }
  );

}
