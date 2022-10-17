import 'package:flutter/material.dart';
import 'package:infakt_app/ui/home_p.dart';
import 'package:infakt_app/ui/root_p.dart';
import 'package:infakt_app/ui/views/auth/login_p.dart';

import 'routes.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case root:
      return MaterialPageRoute(builder: (BuildContext context) {
        GlobalKey rootPageKey = GlobalKey();
        return RootPage(
          key: rootPageKey,
        );
      });
    case login:
      return MaterialPageRoute(builder: (BuildContext context) {
        GlobalKey loginPageKey = GlobalKey();
        return LoginPage(
          key: loginPageKey,
        );
      });
    case home:
      return MaterialPageRoute(builder: (BuildContext context) {
        GlobalKey homePageKey = GlobalKey();
        return HomePage(
          key: homePageKey,
        );
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        GlobalKey homePageKey = GlobalKey();
        return HomePage(
          key: homePageKey,
        );
      });
  }
}
