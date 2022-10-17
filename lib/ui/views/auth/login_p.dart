import 'package:flutter/material.dart';
import 'package:infakt_app/core/providers/auth_pr.dart';
import 'package:infakt_app/core/providers/config_pr.dart';
import 'package:infakt_app/ui/locator.dart';
import 'package:infakt_app/ui/shared/images_sh.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final ConfigModel _configModel = locator<ConfigModel>();

  bool _obscurePassword = true;
  bool _isLoading = false;
  final Map<String, dynamic> _loginData = {
    'email': 'jhansi@gmail.com',
    'password': '123456',
    'rememberme': 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.background),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                child: Card(
                  color: const Color.fromRGBO(255, 255, 255, 0.6),
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _loginKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            Images.logo,
                            height: 150,
                          ),
                          const Text(
                            'INFAKT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Username',
                            ),
                            initialValue: _loginData['email'],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username cannot be empty";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _loginData['email'] = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                child: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            obscureText: _obscurePassword,
                            initialValue: _loginData['password'],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _loginData['password'] = value;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          _loginData['rememberme'] =
                                              _loginData['rememberme'] == 1
                                                  ? 0
                                                  : 1;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blue,
                                            ),
                                            child: _loginData['rememberme'] == 1
                                                ? const Icon(
                                                    Icons.check,
                                                    size: 15.0,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    Icons
                                                        .check_box_outline_blank,
                                                    size: 15.0,
                                                    color: Colors.blue,
                                                  ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Consumer<AuthModel>(
                            builder: (context, authModel, child) =>
                                MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              minWidth: MediaQuery.of(context).size.width * .8,
                              color: Theme.of(context).primaryColor,
                              onPressed: () async {
                                setState(() {
                                  _isLoading = true;
                                });

                                if (_loginKey.currentState!.validate()) {
                                  _loginKey.currentState!.save();

                                  await authModel.login(loginData: _loginData);
                                  if (_configModel.isLoggedIn) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      '/',
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text(
                                            _configModel.loginFailedMessage),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }

                                setState(() {
                                  _isLoading = false;
                                });
                              },
                              child: _isLoading
                                  ? const SizedBox(
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      ),
                                      height: 20,
                                      width: 20,
                                    )
                                  : const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
