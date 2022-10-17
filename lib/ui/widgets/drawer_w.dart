import 'package:flutter/material.dart';
import 'package:infakt_app/core/providers/config_pr.dart';
import 'package:infakt_app/ui/locator.dart';
import 'package:infakt_app/ui/shared/images_sh.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConfigModel _configModel = locator<ConfigModel>();

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: DrawerHeader(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Row(
                  children: <Widget>[
                    if (_configModel.user.imagePath != null)
                      InkWell(
                        onTap: () {},
                        child: Hero(
                          tag: 'ProfileImage',
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                              _configModel.apiConfig['mediaURL'] +
                                  _configModel.user.imagePath,
                            ),
                          ),
                        ),
                      ),
                    if (_configModel.user.imagePath == null)
                      InkWell(
                        onTap: () {},
                        child: const Hero(
                          tag: 'AvatarImage',
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(Images.avatar),
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _configModel.user.name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            _configModel.user.roles!.isNotEmpty
                                ? _configModel.user.roles![0].name.toString()
                                : '',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/home');
              },
              title: const Text('Home'),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Are you sure you want to logout?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('NO'),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await _configModel.removeLoginData();
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text('YES'),
                      ),
                    ],
                  ),
                );
              },
              title: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
