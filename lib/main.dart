import 'package:compound/services/authentication_service.dart';
import 'package:compound/ui/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:compound/services/navigation_service.dart';
import 'package:compound/services/dialog_service.dart';
import 'package:compound/ui/views/login_view.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'managers/dialog_manager.dart';
import 'ui/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<NavigationService>(() => NavigationService()),
          Inject<DialogService>(() => DialogService()),
          Inject<AuthenticationService>(() => AuthenticationService()),
        ],
        builder: (context) {
          return MaterialApp(
            title: 'Compound',
            builder: (context, child) => Navigator(
              key: Injector.get<DialogService>().dialogNavigationKey,
              onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => DialogManager(child: child)),
            ),
            navigatorKey: Injector.get<NavigationService>().navigationKey,
            theme: ThemeData(
              primaryColor: Color.fromARGB(255, 9, 202, 172),
              backgroundColor: Color.fromARGB(255, 26, 27, 30),
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: 'Open Sans',
                  ),
            ),
            home: LoginView(),
            onGenerateRoute: generateRoute,
          );
        });
  }
}
