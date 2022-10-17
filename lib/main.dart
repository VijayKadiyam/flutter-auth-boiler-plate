import 'package:flutter/material.dart';
import 'package:infakt_app/core/providers/auth_pr.dart';
import 'package:infakt_app/core/providers/config_pr.dart';
import 'package:infakt_app/ui/locator.dart';
import 'package:infakt_app/ui/router/router.dart';
import 'package:infakt_app/ui/shared/font_sh.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setupLocator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthModel()),
        ChangeNotifierProvider(create: (context) => ConfigModel()),
      ],
      child: MaterialApp(
        title: 'INFAKT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: Font.primaryFont,
        ),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
