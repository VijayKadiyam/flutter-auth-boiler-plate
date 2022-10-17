import 'package:flutter/material.dart';
import 'package:infakt_app/core/providers/auth_pr.dart';
import 'package:infakt_app/core/providers/config_pr.dart';
import 'package:infakt_app/ui/locator.dart';
import 'package:infakt_app/ui/shared/images_sh.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  getPackageDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  authenticateUser(_, AuthModel authModel, ConfigModel configModel) async {
    configModel.getApiConfig(domain: 'http://192.168.0.181:8080');

    await configModel.fetchLoginData();

    String currentAppVersion = await getPackageDetails();

    if (configModel.loginData.isEmpty) {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacementNamed(context, '/login'),
      );
    } else {
      await authModel.login(loginData: configModel.loginData);
      print('APP: ' + currentAppVersion);
      print('API: ' + configModel.currentAndroidVersionFromApi);

      if (configModel.isLoggedIn) {
        if (currentAppVersion != configModel.currentAndroidVersionFromApi) {
          Navigator.pushReplacementNamed(context, '/updateApp');
        } else {
          Future.delayed(
            Duration.zero,
            () => Navigator.pushReplacementNamed(context, '/home'),
          );
        }
      } else {
        Future.delayed(
          Duration.zero,
          () => Navigator.pushReplacementNamed(context, '/login'),
        );
      }
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final _authModel = Provider.of<AuthModel>(context, listen: false);
      final _configModel = locator<ConfigModel>();
      authenticateUser(context, _authModel, _configModel);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Images.logo,
                height: 150,
              ),
              const Text(
                'Logging you in ...',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              const CircularProgressIndicator(),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
