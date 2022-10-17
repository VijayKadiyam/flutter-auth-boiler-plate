import 'package:flutter/material.dart';
import 'package:infakt_app/ui/widgets/drawer_w.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey drawerKey = GlobalKey();
    return Scaffold(
      drawer: DrawerWidget(
        key: drawerKey,
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}
